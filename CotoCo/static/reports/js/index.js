
//GLOBAL VARS
var new_order_array=[];
var by_order_detail=[];
var bill_order_detail=[];
var bill_order_detail_list=[];
var total = 0;
var subtotal = 0;
var iv_amount = 0 ;


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


    localStorage.Products=null;

    date_to_today('.by_order_date');

    add_from_API_to_select('projects', 'id','project_name', '.by_order_project');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.by_order_supplier');

    add_from_API_to_select('orders', 'id','id', '.by_order_order');

    add_from_API_to_select('activities', 'id','activity_name', '.by_order_activity');

    products_to_memory();

    main_new_order_report();

}

function products_to_memory() {


    $.get('/api/products/', function (data) {

        $('.by_order_product').append($('<option>', {
                value: 0,
                text: "Todos(as)"
            }));

        $.each(data, function (i) {

            $('.by_order_product').append($('<option>', {
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

        $(select_class).append($('<option>', {
                value: 0,
                text: "Todos(as)"
            }));

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

function add_bill_data_to_table(data){

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

    $('.by_order_order').append($('<option>', {
        value: 0,
        text:"Todos(as)"
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

function check_data_filled(){

    //SELECTORS

    var supplier = $('.by_order_supplier');
    var project = $('.by_order_project');
    var activity = $('.by_order_activity');

    var product = $('.by_order_product');

    var type = $('.by_order_type');


    var bool = false;


    if(!project.val()){
        bool = false;
        alertify.alert('Debe Elegir un valor para Proyecto');
        return bool
    }
    if(!activity.val()){
        bool = false;
        alertify.alert('Debe Elegir un valor para Actividad');
        return bool
    }

    if(!supplier.val()){
        bool = false;
        alertify.alert('Debe Elegir un valor para proveedor');
        return bool
    }

    if (type.val()==2 || type.val()==4){

        if(!product.val()){
        bool = false;
        alertify.alert('Debe Elegir un valor para Producto');
        return bool
    }

    }

    bool = true;
    return bool;


}

function PopupCenter(url, title, w, h, data) {
    // // Fixes dual-screen position                         Most browsers      Firefox
    // var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    // var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
    //
    // var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    // var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
    //
    // var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    // var top = ((height / 2) - (h / 2)) + dualScreenTop;
    // var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    var newWindow = window.open(url, '_blank' );
    newWindow.document.write(data);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}

function generate_report() {

    $.ajax({
        method: "GET",
        url: "/reports/general/",
        async: false,
        data:({
            type: $('.by_order_type').val(),
            project:$('.by_order_project').val(),
            activity:$('.by_order_activity').val(),
            supplier:$('.by_order_supplier').val(),
            product:$('.by_order_product').val(),
            date_ini:$('.by_order_date_ini').val(),
            date_end:$('.by_order_date_end').val()

        }),
    })
        .fail(function(data){
            console.log(data.responseText);
            alert("Hubo un problema al crear el reporte, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
        })
        .success(function(data){
            // var wind = window.open("", "popupWindow", "width=1000,height=768,scrollbars=yes");
            // wind.document.write(data);

            PopupCenter('', 'Reporte', 1000, 768, data)

        });//ajax

}

function main_new_order_report() {

    //Selectors
    var html = $('html');

    var supplier = $('.by_order_supplier');
    var project = $('.by_order_project');
    var order = $('.by_order_order');
    var activity = $('.by_order_activity');
    var product = $('.by_order_product');
    var type = $('.by_order_type');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Print = $('.Btn_Print');


    //events

    type.on('change', function () {

        if (type.val()==2 || type.val()==4){

            product.prop('disabled', false)

        }
        else{
            product.prop('disabled', true)
        }

    });

    project.on('change', function () {

        //filter_order_by_supplier(supplier.val(),project.val())

    });

    Btn_Confirm.on('click', function(event){

        event.preventDefault();

        var bool;

        bool = check_data_filled();

        if (bool == true) {

            generate_report();

        }

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

    activity.select2({
    theme: "bootstrap",
    placeholder:"Seleccione...",
    width: '100%',
    allowClear: true,
    language: "es"
    });

    product.select2({
    theme: "bootstrap",
    placeholder:"Seleccione...",
    width: '100%',
    allowClear: true,
    language: "es"
    });
    //Hide Buttons

    Btn_Print.hide();
    product.prop('disabled', true)


}

$(document).on('ready', function(){

   new_order_report();

});


