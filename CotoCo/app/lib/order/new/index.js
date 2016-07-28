
var $ = require('jquery');
var page = require('page');

var template = require('./template.jade');

var new_order_array=[];

page('/order/new',new_order);


function new_order() {

    $.ajaxSetup({
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

    $('#page-wrapper').html(template());

    localStorage.Products=null;

    date_to_today('.new_order_date');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_order_supplier');

    add_from_API_to_select('projects', 'id','project_name', '.new_order_project');

    add_from_API_to_select('activities', 'id','activity_name', '.new_order_activity');

    products_to_memory();

    main_new_order();

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

function main_new_order () {
    //selectors
    var code = $('.order_product_code');
    var search = $('.new_order_search');
    var supplier = $('.new_order_supplier');
    var project = $('.new_order_project');
    var activity = $('.new_order_activity');

    //Browser Events

    code.on('keypress', function (event) {

        if(event.which === 13){
            event.preventDefault();
            add_product();
            search.val('').trigger('change');
            code.val('');
            code.focus();
        }
    });

    search.on('select2:select', function (evt) {
        evt.preventDefault();
        code.val(search.val());
        code.focus();
    });

    //Init Items

    search.select2({

        theme: "bootstrap",
        placeholder:"Busqueda...",
        width: '100%',
        allowClear: true,
        language: "es"
    });

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

    activity.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });


}

$(document).on('ready', function(){

});

function add_product(){

    let codeString = $('.order_product_code').val();
    let products=JSON.parse(localStorage.Products);

    var code = codeString.split('*')[0];
    var qty = codeString.split('*')[1];

    if( qty === undefined){
        qty=1;
    }

    //filter product by code
    products = $.grep(products, function(element){
        return element.product_code == code;
    });

    if (products.length){
        var subt = products[0].product_price*qty;
        add_new_row(products[0].product_code,products[0].product_description,qty, 'unidad',products[0].product_price ,subt )
    }
    else{
        alert('NO EXISTE EL PRODUCTO')
    }

}

function add_new_row(code, desc, qty, unit, uprice, subt ){

    var new_row=`<tr class="${code}"><td>${code}</td><td>${desc}</td><td style="padding:0; width:13%"><input type="number" style="width:100%;
            border:0px" class="form-control ${code}_product_qty"/></td><td>${unit}</td><td style="padding:0; width:13%"><input type="number" 
            style="width:100%;border:0px" class="form-control ${code}_product_uprice"/></td><td>${subt}</td><td style="padding:0; width:10%" 
            class="inner-addon"><i class="fa fa-paste add_note"></i><i style="margin-left:34px" class="fa fa-minus revove_row"></i></td></tr>`;

    $('.table-body').append(new_row);

    $(`.${code}_product_qty`).val(qty);
    $(`.${code}_product_uprice`).val(uprice);

}


$('html').on('click','.revove_row', function () {

    event.preventDefault();
    var row=$(this).closest("tr");
    var rowIndex = row.index();
    //
    // var totalsubquitar= matrixventa[rowIndex][4];
    // var totalivquitar= matrixventa[rowIndex][5];
    // var totalquitar = matrixventa[rowIndex][6];
    // var cantidadquitar=matrixventa[rowIndex][3];
    //
    // totalkg=totalkg-cantidadquitar;
    // totalart=totalart-1;
    // totalventa=Math.round((totalventa-totalquitar) * 1000) / 1000;
    // totaliv=Math.round((totaliv-totalivquitar) * 1000) / 1000;
    // subtotal=Math.round((subtotal-totalsubquitar) * 1000) / 1000;
    // preciosindesc=totalventa;
    // ivsindesc=totaliv;
    //
    // $('.totalventa').html(totalventa.toFixed(2));
    // $('.totaliv').html(totaliv.toFixed(2));
    // $('.subtotal').html(subtotal.toFixed(2));
    // $('.totalart').html(totalart);
    // $('.totalkg').html(totalkg+' Kg');
    //
    // $('.precio').priceFormat({
    //     prefix: '₡ ',
    //     centsSeparator: ',',
    //     thousandsSeparator: '.'
    // });
    //
    // matrixventa.splice( rowIndex,1 );
    // //console.log(matrixventa);
    $(this).parent().parent().remove();
    // if (matrixventa.length==0){
    //     $("#BtnConfirmar").prop("disabled",true);
    // }
});
