
//GLOBAL VARS

var new_order_array=[];
var new_order_detail=[];
var last_order_detail=[];
var total = 0;
var subtotal = 0;
var iv_amount = 0 ;
var order_id = 0;


function edit_order() {

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


    localStorage.Products=null;

    //date_to_today('.new_order_date');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_order_supplier');

    add_from_API_to_select('projects', 'id','project_name', '.new_order_project');

    add_from_API_to_select('activities', 'id','activity_name', '.new_order_activity');

    products_to_memory();

    let id = JSON.parse(localStorage.order_to_edit);

    order_id=id.id;

    $('.order_header').text( `Editar orden de compra # ${order_id}`);

    main_edit_order();

    load_order(id.id);
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

    let codeString = $('.order_product_code').val();
    let products=JSON.parse(localStorage.Products);

    var code = codeString.split('*')[0];
    var qty = codeString.split('*')[1];

    if( qty === undefined){
        qty=1;
    }

    var is_on_array = is_code_on_array(new_order_array,code);

    if(is_on_array === -1){
        //filter product by code
        products = $.grep(products, function(element){
            return element.product_code == code;
        });

        if (products.length){
            var subt = (products[0].product_price*qty)*((100-products[0].product_discount)/100);
            var pudisc = (products[0].product_price)*((100-products[0].product_discount)/100);
            var iv=0;

            if( products[0].product_usetaxes){
                iv=products[0].product_taxes;
            }

            add_new_row(products[0].product_code, products[0].product_description, qty, products[0].product_unit,
                        products[0].product_price , subt, products[0].id, products[0].product_discount, iv, pudisc); //las 0 is disc
        }
        else{
            //FALTA mensaje de que no existe el producto
            alertify.alert('Error de código','No existe un producto con el código indicado.')
        }
    }//if

    else{

        new_order_array = row_update(is_on_array, code, qty, new_order_array, 0, 1,0);
        update_totals();

    }//else


}

function add_new_row(code, desc, qty, unit, uprice, subt, id, disc, iv, pudisc ){

    let Btn_Confirm = $('.Btn_Confirm');

    new_order_array.push([code, qty, parseFloat(uprice), subt, desc, unit, id, disc, iv]);

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
            <td class="${code}_product_pudisc price" >${pudisc.toFixed(2)}</td>
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
    var new_pudisc = 0;


    if (ctrl == 1){//means add already existing product on table

        actual_qty = array[row][1];
        actual_uprice = array[row][2];
        new_disc =  array[row][7];

        new_qty = parseFloat(actual_qty) + parseFloat(qty);

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

        new_pudisc = (actual_uprice)*(1-(new_disc/100));

    }

    if(ctrl == 2){//means update qty

        actual_uprice = array[row][2];
        new_disc =  array[row][7];

        new_qty = parseFloat(qty);

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

        new_pudisc = (actual_uprice)*(1-(new_disc/100));

    }

    if(ctrl == 3){//means update price

        actual_uprice = new_price;

        new_qty = array[row][1];

        new_disc =  array[row][7];

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

        new_pudisc = (actual_uprice)*(1-(new_disc/100));

    }

    if(ctrl == 4){//means update discount

        actual_uprice = array[row][2];

        new_qty = array[row][1];

        new_disc =  disc;

        new_subt = (actual_uprice*new_qty)*(1-(new_disc/100));

        new_pudisc = (actual_uprice)*(1-(new_disc/100));
    }
    //calculate values


    //update values

    $(`.${code}_product_qty`).val(new_qty);
    $(`.${code}_product_pudisc`).text(new_pudisc.toFixed(2));
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

    $.each(new_order_array, function(i) {

        subtotal = subtotal+new_order_array[i][3];//new_order_array[i][3] is the subt amount.
        iv_amount=iv_amount+(new_order_array[i][3]*(new_order_array[i][8]/100));//new_order_array[i][8] is the IV


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

function save_new_order(){

    save_detail();

    $.ajax({
        method: "PUT",
        url: `/api/orders/${order_id}/`,
        async: false,

        data: JSON.stringify({
            "order_date": $('.new_order_date').val(),
            "order_deliver_date": $('.new_order_date_delivery').val(),
            "order_supplier": $('.new_order_supplier').val(),
            "order_project": $('.new_order_project').val(),
            "order_activity": $('.new_order_activity').val(),
            "order_product_list": new_order_detail,
            "order_subtotal": subtotal,
            "order_iv": iv_amount,
            "order_total": total

        }),//JSON object
        contentType:"application/json; charset=utf-8",
        dataType:"json"
    })
        .fail(function(data){
            new_order_detail=[];
            console.log(data.responseText);
            alertify.alert('Error',"Hubo un problema al crear la orden, por favor intente de nuevo o contacte a Emanuel al # 83021964 " +
                "con nua foto de este error " + data.responseText);
        })
        .success(function(data){
            alertify.alert('Completado','Orden Actualizada con exito');
            window.open(`/orderpdf2/${data.id}/`);
            window.location.replace("/admin/orders/order/");
        });//ajax

}

function save_detail(){

    new_order_detail=[];

    $.each(new_order_array, function(i) {
        $.ajax({
            method: "POST",
            url: "/api/order_detail/",
            async: false,

            data: JSON.stringify({
                "order_detail_product": new_order_array[i][6],
                "order_detail_product_code": new_order_array[i][0],
                "order_detail_description": new_order_array[i][4],
                "order_detail_unit": new_order_array[i][5],
                "order_detail_price": new_order_array[i][2],
                "order_detail_amount": new_order_array[i][1],
                "order_detail_discount": new_order_array[i][7],
                "order_detail_iv": new_order_array[i][8],
                "order_detail_total": parseFloat(new_order_array[i][3]).toFixed(2)

            }),//JSON object
            contentType:"application/json; charset=utf-8",
            dataType:"json"
        })
            .fail(function(data){
                console.log(data.responseText);
                alertify.alert('Error',"Hubo un problema al guardar los detalles de la orden, por favor intente de nuevo o contacte a " +
                    "Emanuel al # 83021964 con nua foto de este error " + data.responseText);
            })
            .success(function(data){
                new_order_detail.push(data.id);
            });//ajax
    });

}

function load_order(id) {


    $.get(`/api/orders/${id}/`, function (data) {

        $('.new_order_date').val(data.order_date);
        $('.new_order_date_delivery').val(data.order_deliver_date);
        $('.new_order_supplier').val(data.order_supplier).trigger("change");
        $('.new_order_project').val(data.order_project).trigger("change");
        $('.new_order_activity').val(data.order_activity).trigger("change");

        last_order_detail=data.order_product_list;


    }).success(function (){
        add_loaded_to_table();
    });



}

function add_loaded_to_table(){

//todo fix insert order cause by get async

    $.each(last_order_detail, function (i) {

        $.get(`/api/order_detail/${last_order_detail[i]}/`,false)
        .success(function (data) {
            var pudisc = (parseFloat(data.order_detail_price))*((100-data.order_detail_discount)/100);
            add_new_row(data.order_detail_product_code, data.order_detail_description, parseFloat(data.order_detail_amount),
                        data.order_detail_unit, parseFloat(data.order_detail_price), parseFloat(data.order_detail_total),
                        data.order_detail_product, data.order_detail_discount, data.order_detail_iv, pudisc)
        });

    });
}


function check_data_filled(){

    //SELECTORS
    var date = $('.new_order_date');
    var delivery_date = $('.new_order_date_delivery');
    var supplier = $('.new_order_supplier');
    var project = $('.new_order_project');
    var activity = $('.new_order_activity');
    var bool = false;


    if(!date.val()){
        bool = false;
        return bool
    }
    if(!delivery_date.val()){
        bool = false;
        alertify.alert('Error en Fecha de entrega','Debe Elegir una Fecha de Entrega');
        return bool
    }

    if(!supplier.val()){
        bool = false;
        alertify.alert('Error en proveedor','Debe Elegir un proveedor');
        return bool
    }
    if(!project.val()){
        bool = false;
        alertify.alert('Error en Proyecto','Debe Elegir un Proyecto');
        return bool
    }
    if(!activity.val()){
        bool = false;
       alertify.alert('Error en Actividad','Debe Elegir una Actividad');
        return bool
    }
    else{
        bool = true;
        return bool;
    }

}


function PopupCenter(url, title, w, h) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}

// MAIN AND DOC READY
function main_edit_order () {


    //Selectors
    var html = $('html');

    var code = $('.order_product_code');
    var search = $('.new_order_search');
    var supplier = $('.new_order_supplier');
    var project = $('.new_order_project');
    var activity = $('.new_order_activity');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Edit = $('.Btn_Edit');
    var Btn_Save = $('.Btn_Save');

    new_order_array=[];
    new_order_detail=[];
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

        new_order_array.splice( rowIndex,1 );

        $(this).parent().parent().remove();

        update_totals();

        if (new_order_array.length==0){
            Btn_Confirm.hide();
        }

    });

    html.on('click','.popup_product', function () {

        event.preventDefault();
        // var newwindow=window.open('/admin/products/product/add/?_popup=1','','height=700,width=600');
		PopupCenter('/admin/products/product/add/?popup', 'Agregar Producto', 600, 800)

    });

    html.on('click','.refresh_product', function () {

        search.html('');

        search.append($('<option>', {
             value: ''
        })).trigger('change');

        var $icon = $( ".refresh_product");
        var animateClass = "glyphicon-refresh-animate";

        $icon.addClass( animateClass );
        // setTimeout is to indicate some async operation
        window.setTimeout( function() {
        $icon.removeClass( animateClass );
        }, 1000 );

        localStorage.Products=null;
        products_to_memory();

    });

    html.on('change','.no_qty', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_order_array[rowIndex][0];
        let qty = $(`.${code}_product_qty`).val();
        let uprice = new_order_array[rowIndex][2];

        row_update(rowIndex, code, qty, new_order_array, uprice, 2);

        update_totals();

    });

    html.on('change','.no_uprice', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_order_array[rowIndex][0];
        let qty = new_order_array[rowIndex][1];
        let uprice = $(`.${code}_product_uprice`).val();

        row_update(rowIndex, code, qty, new_order_array, uprice, 3);

        update_totals();

    });

    html.on('change','.no_disc', function () {

        event.preventDefault();
        let row = $(this).closest("tr");
        let rowIndex = row.index();

        let code = new_order_array[rowIndex][0];
        let qty = new_order_array[rowIndex][1];
        let uprice = new_order_array[rowIndex][2];
        let disc = $(`.${code}_product_disc`).val();

        row_update(rowIndex, code, qty, new_order_array, uprice, 4, disc);

        update_totals();

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

        save_new_order();
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



    //Hide Buttons
    Btn_Confirm.hide();
    Btn_Edit.hide();
    Btn_Save.hide();

    //$('.new_order_supplier').val('1');
}

$(document).on('ready', function(){

    edit_order();

});