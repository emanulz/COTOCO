var $ = require('jquery');
var page = require('page');

var template = require('./template.jade');


//GLOBAL VARS
var new_order_array=[];
var by_order_detail=[];
var bill_order_detail=[];
var bill_order_detail_list=[];
var total = 0;
var subtotal = 0;
var iv_amount = 0 ;

//PAGE NAVIGATION
page('/admin/reports/byorder/',new_order_report);

//FUNCTIONS
function new_order_report() {

    $.ajaxSetup({
        async:false,
        beforeSend: function(xhr, settings) {
            if(settings.type == "POST"){
                xhr.setRequestHeader("X-CSRFToken", $('[name="csrfmiddlewaretoken"]').val());
            }
            if(settings.type == "PUT"){
                xhr.setRequestHeader("X-CSRFToken", $('[name="csrfmiddlewaretoken"]').val());
            }
            if(settings.type == "PATCH"){
                xhr.setRequestHeader("X-CSRFToken", $('[name="csrfmiddlewaretoken"]').val());
            }
        }
    });//ajax setup

    $('#page-content-wrapper').html(template());

    localStorage.Products=null;

    date_to_today('.by_order_date');

    add_from_API_to_select('projects', 'id','project_name', '.by_order_project');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.by_order_supplier');

    add_from_API_to_select('orders', 'id','id', '.by_order_order');

    products_to_memory();

    $('li.active').removeClass('active');
    $('.by_order_li').addClass('active');

    main_new_order_report();

}

function products_to_memory() {


    $.get('/api/products/', function (data) {

        $.each(data, function (i) {

            $('.new_order_search').append($('<option>', {
                value: data[i].product_code,
                text: data[i].product_description
            }));
        });

        localStorage.Products=JSON.stringify(data);
    });

}//SAVE PRODUCTS TO LOCAL STORAGE

function add_from_API_to_select(api, id_field, text_field, select_class) {


    $.get(`/api/${api}/`, function (data) {

        localStorage[api]=JSON.stringify(data);

        $.each(data, function (i) {

            $(select_class).append($('<option>', {
                value: data[i][id_field],
                text: data[i][text_field]
            }));
        })

    });
}

function date_to_today(date_field_class) {
    //date
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);
    var year=now.getFullYear();
    var today = (year)+"-"+(month)+"-"+(day) ;
    $(date_field_class).val(today);
}

function load_order(id) {


    $.get(`/api/orders/${id}/`, function (data) {

        by_order_detail=data.order_product_list;


    }).success(function (){

        add_loaded_to_table();
    });



}

function add_loaded_to_table(){


    $.each(by_order_detail, function (i) {

        $.get(`/api/order_detail/${by_order_detail[i]}/`, function (data) {

            add_new_row(data);

        });

    });
}

function add_new_row(data){



    var new_row=`<tr class="${data.order_detail_product}"><td>${data.order_detail_product}</td><td>desc</td>
            <td>${data.order_detail_amount}*${data.order_detail_price}</td><td>${data.order_detail_price}</td>
            </tr>`;

    $('.table-body').append(new_row);



}

function load_bills(order){


    $.get(`/api/bills/?bill_order=${order}`, function (data) {

        console.log(data);

        bill_order_detail=data;

    }).success(function (){

        add_bill_to_table();
    });

}

function add_bill_to_table() {


    $.each(bill_order_detail, function (i) {

        bill_order_detail_list = bill_order_detail[i];

        add_bill_data_to_table(bill_order_detail_list);

    });

}



function  add_bill_data_to_table(data){

    console.log(data);
    $('.table-head').append(`<th>Fact</th>`);

    $.each(data, function (i) {

        $.get(`/api/bill_detail/${data[i]}/`, function (data) {

            $(`.${data.bill_detail_product}`).append(`<td>${data.bill_detail_price}</td>`);

            console.log(`$(.${data.bill_detail_product}`).append(`<td>${data.bill_detail_price}</td>)`);

        });

    });



    //$('.table-head').append(`<th>Fact ${data.id}</th>`);

    // var new_row=`<tr class="${data.order_detail_product}"><td>${data.order_detail_product}</td><td>desc</td>
    //         <td>${data.order_detail_amount}*${data.order_detail_price}</td><td>${data.order_detail_price}</td>
    //         </tr>`;
    //
    // $('.table-body').append(new_row);





}


function filter_order_by_supplier(supplier, project){


    let AllOrders = JSON.parse(localStorage.orders);

    $('.by_order_order').html('');

    $('.by_order_order').append($('<option>', {
        value: ''
    })).trigger('change');


    $.each(AllOrders, function (i) {

        if(AllOrders[i].order_supplier==supplier && AllOrders[i].order_project==project){


            $('.by_order_order').append($('<option>', {
                value: AllOrders[i].id,
                text: AllOrders[i].id
            })).trigger('change');
        }
    });

}

function main_new_order_report() {

    //Selectors
    var html = $('html');

    var supplier = $('.by_order_supplier');
    var project = $('.by_order_project');
    var order = $('.by_order_order');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Print = $('.Btn_Print');


    //events

    supplier.on('change', function () {

        filter_order_by_supplier(supplier.val(),project.val())

    });

    project.on('change', function () {

        filter_order_by_supplier(supplier.val(),project.val())

    });

    Btn_Confirm.on('click', function(event){

        event.preventDefault();

        load_order(order.val());

        //load_bills(order.val());

        Btn_Confirm.hide();
        Btn_Print.show().prop('disabled', false);


    });

    //Init Items


    supplier.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });

    project.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });

    order.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });

    //Hide Buttons

    Btn_Print.hide();


}

