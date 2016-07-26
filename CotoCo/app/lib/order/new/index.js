
var $ = require('jquery');
var page = require('page');

var template = require('./template.jade');

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
    products_to_memory();

    main_new_order();

}

function add_new_row(code,desc, unit, subt ){

    var new_row=`<tr><td>${code}</td><td>${desc}</td><td style="padding:0; width:13%"><input type="number" style="width:100%;
            border:0px" class="form-control"/></td><td>${unit}</td><td style="padding:0; width:13%"><input type="number" 
            style="width:100%;border:0px" class="form-control"/></td><td>${subt}</td><td style="padding:0; width:10%" 
            class="inner-addon"><i class="fa fa-paste"></i><i style="margin-left:34px" class="fa fa-minus"></i></td></tr>`;

    $('.table-body').append(new_row);

}

function products_to_memory() {


    $.get('/api/products/', function (data) {

        localStorage.Products=JSON.stringify(data);
        console.log(localStorage.Products);
    });

}//SAVE PRODUCTS TO LOCAL STORAGE

function add_product(){

    let code = $('.order_product_code').val();
    let products=JSON.parse(localStorage.Products);

    //filtro de producto
    products = $.grep(products, function(element){
        return element.product_code == code;
    });

    if (products.length){
        add_new_row(products[0].product_code,products[0].product_description, 'unidad', products[0].product_avg_price )
    }
    else{
        alert('NO EXISTE EL PRODUCTO')
    }





}

function main_new_order () {

    $('.order_product_code').on('keypress', function (event) {

        if(event.which === 13){
            event.preventDefault();
            add_product()
        }
    });
}

$(document).on('ready', function(){

});
