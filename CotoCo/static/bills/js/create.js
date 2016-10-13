
//GLOBAL VARS
var new_bill_array=[];
var new_bill_detail=[];
var total = 0;
var subtotal = 0;
var iv_amount = 0 ;


//FUNCTIONS
function new_bill() {

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

    localStorage.Products = null;

    date_to_today('.new_bill_date');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_bill_supplier');

    add_from_API_to_select('orders', 'id','id', '.new_bill_order');

    products_to_memory();

    main_new_bill();

}

function products_to_memory() {


    $.get('/api/products/', function (data) {

        $.each(data, function (i) {

            $('.new_bill_search').append($('<option>', {
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

function filter_order_by_supplier(supplier){


    let AllOrders = JSON.parse(localStorage.orders);

    $('.new_bill_order').html('');

    $('.new_bill_order').append($('<option>', {
         value: ''
     })).trigger('change');
    $('.new_bill_order').append($('<option>', {
            value: '1',
            text: 'Sin Orden de Compra'
     })).trigger('change');


    $.each(AllOrders, function (i) {


        if(AllOrders[i].order_supplier==supplier){


            $('.new_bill_order').append($('<option>', {
                value: AllOrders[i].id,
                text: AllOrders[i].id
            })).trigger('change');
        }
    });

}

function is_code_on_array(array , code){

    var control = -1;

    $.each(array, function(i) {

        if (array[i][0]==code){
            control = i;
            return false;
        }
    });

    return control;
}

function add_product(){

    let codeString = $('.bill_product_code').val();
    let products=JSON.parse(localStorage.Products);

    var code = codeString.split('*')[0];
    var qty = codeString.split('*')[1];

    if( qty === undefined){
        qty=1;
    }

    var is_on_array = is_code_on_array(new_bill_array,code);

    if(is_on_array === -1){
        //filter product by code
        products = $.grep(products, function(element){
            return element.product_code == code;
        });

        if (products.length){

            var subt = (products[0].product_price*qty)*((100-products[0].product_discount)/100);
            var iv=0;

            if( products[0].product_usetaxes){
                iv=products[0].product_taxes;
            }

            add_new_row(products[0].product_code, products[0].product_description, qty, products[0].product_unit,
                        products[0].product_price , subt, products[0].id, products[0].product_discount, iv); //last 0 is disc


        }
        else{
            //FALTA mensaje de que no existe el producto
            alertify.alert('Error de código','No existe un producto con el código indicado.')
        }
    }//if

    else{

        new_bill_array = row_update(is_on_array, code, qty, new_bill_array, 0, 1);
        update_totals();

    }//else


}

function add_new_row(code, desc, qty, unit, uprice, subt, id, disc, iv ){

    let Btn_Confirm = $('.Btn_Confirm');

    new_bill_array.push([code, qty, parseFloat(uprice), subt, desc, unit, id, disc, iv]);

    var new_row=`<tr class="${code}">
            <td>${code}</td>
            <td>${desc}</td>
            <td style="padding:0; width:8%"><input type="number" style="width:100%;border:0px" 
            class="form-control ${code}_product_qty no_qty"/></td>
            <td style="width:6%">${unit}</td>
            <td style="padding:0; width:17%"><input type="number" style="width:100%;border:0px" 
            class="form-control ${code}_product_uprice no_uprice"/></td>
            <td style="padding:0; width:7%"><input value="${disc}" type="number" style="width:100%;border:0px" 
            class="form-control ${code}_product_disc no_disc"/></td>
            <td class="${code}_product_iv" >${iv}%</td>
            <td class="${code}_product_subt price" >${subt.toFixed(2)}</td>
            <td style="text-align: center; padding:0; width:5%" class="inner-addon">
            <i class="fa fa-minus remove_row"></i></td>
            </tr>`;

    $('.table-body').append(new_row);

    $(`.${code}_product_qty`).val(qty);
    $(`.${code}_product_uprice`).val(uprice);

    Btn_Confirm.show();

    update_totals();


}

function row_update(row, code, qty, array, new_price, ctrl, disc){

    var actual_qty = 0;
    var actual_uprice = 0;
    var new_qty = 0;
    var new_subt = 0;
    var new_disc = 0;


    if (ctrl == 1){//means add already existing product on table

        actual_qty = array[row][1];
        actual_uprice = array[row][2];
        new_disc =  array[row][7];

        new_qty = parseFloat(actual_qty) + parseFloat(qty);

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

    }

    if(ctrl == 2){//means update qty

        actual_uprice = array[row][2];
        new_disc =  array[row][7];

        new_qty = parseFloat(qty);

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

    }

    if(ctrl == 3){//means update price

        actual_uprice = new_price;

        new_qty = array[row][1];

        new_disc =  array[row][7];

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

    }

    if(ctrl == 4){//means update discount

        actual_uprice = array[row][2];

        new_qty = array[row][1];

        new_disc =  disc;

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));
    }
    //calculate values


    //update values

    $(`.${code}_product_qty`).val(new_qty);
    $(`.${code}_product_subt`).text(new_subt.toFixed(2));

    array[row][1] = new_qty;
    array[row][2] = actual_uprice ;
    array[row][3] = new_subt;
    array[row][7] = new_disc;


    return array;

}

function update_totals() {

    subtotal=0;
    iv_amount= 0;

    $.each(new_bill_array, function(i) {

        subtotal = subtotal+new_bill_array[i][3];//new_order_array[i][3] is the subt amount.
        iv_amount=iv_amount+(new_bill_array[i][3]*(new_bill_array[i][8]/100));//new_order_array[i][8] is the IV


    });

    total = subtotal+iv_amount;

    iv_amount = parseFloat(iv_amount).toFixed(2);
    subtotal = parseFloat(subtotal).toFixed(2);
    total = total.toFixed(2);

    $('.No_Sub_Total').text(subtotal);
    $('.No_Sub_Iv').text(iv_amount);
    $('.No_Total').text(total);

    $('.price').priceFormat({
        prefix: '₡ ',
        centsSeparator: ',',
        thousandsSeparator: '.'
    });
}

function save_new_bill(){

    save_detail();

    $.ajax({
        method: "POST",
        url: "/api/bills/",
        async: false,

        data: JSON.stringify({
            "bill_date": $('.new_bill_date').val(),
            "bill_supplier": $('.new_bill_supplier').val(),
            "bill_supplier_bill":$('.new_bill_supplier_bill').val(),
            "bill_order": $('.new_bill_order').val(),
            "bill_detail_list": new_bill_detail,
            "bill_subtotal": subtotal,
            "bill_iv": iv_amount,
            "bill_total": total,
            "bill_debt": total

        }),//JSON object
        contentType:"application/json; charset=utf-8",
        dataType:"json"
    })
        .fail(function(data){
            console.log(data.responseText);
           alertify.alert('Error',"Hubo un problema al crear la factura, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
        })
        .success(function(data){
            window.location.replace("/admin/bills/bill/");
        });//ajax

}

function save_detail(){

    new_bill_detail=[];

    $.each(new_bill_array, function(i) {
        $.ajax({
            method: "POST",
            url: "/api/bill_detail/",
            async: false,

            data: JSON.stringify({

                "bill_detail_product": new_bill_array[i][6],
                "bill_detail_product_code": new_bill_array[i][0],
                "bill_detail_description": new_bill_array[i][4],
                "bill_detail_unit": new_bill_array[i][5],
                "bill_detail_price": new_bill_array[i][2],
                "bill_detail_amount": new_bill_array[i][1],
                "bill_detail_discount": new_bill_array[i][7],
                "bill_detail_iv": new_bill_array[i][8],
                "bill_detail_total": parseFloat(new_bill_array[i][3]).toFixed(2)

            }),//JSON object
            contentType:"application/json; charset=utf-8",
            dataType:"json"
        })
            .fail(function(data){
                console.log(data.responseText);
                alertify.alert('Error',"Hubo un problema al crear la venta, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
            })
            .success(function(data){
                console.log(data.id);
                new_bill_detail.push(data.id);
            });//ajax
    });

}

function check_data_filled(){

    //SELECTORS
    var date = $('.new_bill_date');
    var supplier = $('.new_bill_supplier');
    var order = $('.new_bill_order');
    var bill = $('.new_bill_supplier_bill');

    var bool = false;


    if(!date.val()){
        bool = false;
        return bool
    }


    if(!supplier.val()){
        bool = false;
        alertify.alert('Error en Proveedor','Debe Elegir un Proveedor');
        return bool
    }
    if(!order.val()){
        bool = false;
        alertify.alert('Error en Orden de Compra','Debe Elegir una Orden de Compra');
        return bool
    }
    if(!bill.val()){
        bool = false;
        alertify.alert('Error en Proveedor','Debe Ingresar el numero de Factura del Proveedor');
        return bool
    }
    else{
        bool = true;
        return bool;
    }

}

// MAIN AND DOC READY
function main_new_bill () {

    //Selectors
    var html = $('html');

    var code = $('.bill_product_code');
    var search = $('.new_bill_search');
    var supplier = $('.new_bill_supplier');
    var order = $('.new_bill_order');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Edit = $('.Btn_Edit');
    var Btn_Save = $('.Btn_Save');

    new_bill_array=[];
    new_bill_detail=[];
    total = 0;
    subtotal = 0;
    iv_amount = 0 ;

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

    search.on('select2:select', function (event) {
        event.preventDefault();
        code.val(search.val());
        code.focus();
    });

    html.on('click','.remove_row', function () {

        event.preventDefault();
        var row=$(this).closest("tr");
        var rowIndex = row.index();

        new_bill_array.splice( rowIndex,1 );

        $(this).parent().parent().remove();

        update_totals();

        if (new_bill_array.length==0){
            Btn_Confirm.hide();
        }

    });

    html.on('change','.no_qty', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_bill_array[rowIndex][0];
        let qty = $(`.${code}_product_qty`).val();
        let uprice = new_bill_array[rowIndex][2];

        row_update(rowIndex, code, qty, new_bill_array, uprice, 2);

        update_totals();

    });

    html.on('change','.no_disc', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_bill_array[rowIndex][0];
        let qty = new_bill_array[rowIndex][1];
        let uprice = new_bill_array[rowIndex][2];
        let disc = $(`.${code}_product_disc`).val();

        row_update(rowIndex, code, qty, new_bill_array, uprice, 4, disc);

        update_totals();

    });

    html.on('change','.no_uprice', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_bill_array[rowIndex][0];
        let qty = new_bill_array[rowIndex][1];
        let uprice = $(`.${code}_product_uprice`).val();

        row_update(rowIndex, code, qty, new_bill_array, uprice, 3);

        update_totals();

    });

    supplier.on('change', function () {

        filter_order_by_supplier(supplier.val())

    });

    //Button Events
    Btn_Confirm.on('click', function(event){

        event.preventDefault();

        var bool;

        bool = check_data_filled();

        if (bool == true){

            $('.main-page-cont').find(':input').prop('disabled', true);
            $('.remove_row').addClass('unclickable');
            $('.add_note').addClass('unclickable');


            Btn_Confirm.hide();
            Btn_Edit.show().prop('disabled', false);
            Btn_Save.show().prop('disabled', false);

        }
    });

    Btn_Edit.on('click', function(event){
        event.preventDefault();

        $('.remove_row').removeClass('unclickable');
        $('.add_note').removeClass('unclickable');
        $('.main-page-cont').find(':input').prop('disabled', false);

        Btn_Confirm.show();
        Btn_Edit.hide();
        Btn_Save.hide();
    });

    Btn_Save.on('click', function(event){
        event.preventDefault();

        save_new_bill();
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

    order.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });


    //Hide Buttons
    Btn_Confirm.hide();
    Btn_Edit.hide();
    Btn_Save.hide();



}

$(document).on('ready', function(){

    new_bill();

});