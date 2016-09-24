//GLOBAL VARS
var new_request_array=[];
var new_request_detail=[];


//FUNCTIONS
function new_request() {

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

    date_to_today('.new_request_date');

    add_from_API_to_select('projects', 'id','project_name', '.new_request_project');

    add_from_API_to_select('activities', 'id','activity_name', '.new_request_activity');

    products_to_memory();

    main_new_order();

}

function products_to_memory() {

    $.get('/api/products/', function (data) {

        $.each(data, function (i) {

            $('.new_request_search').append($('<option>', {
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

    let codeString = $('.request_product_code').val();
    let products=JSON.parse(localStorage.Products);

    var code = codeString.split('*')[0];
    var qty = codeString.split('*')[1];

    if( qty === undefined){
        qty=1;
    }

    var is_on_array = is_code_on_array(new_request_array,code);

    if(is_on_array === -1){
        //filter product by code
        products = $.grep(products, function(element){
            return element.product_code == code;
        });

        if (products.length){

            add_new_row(products[0].product_code, products[0].product_description, qty, products[0].product_unit,
                        products[0].id); //last 0 is disc
        }
        else{
            //FALTA mensaje de que no existe el producto
            alert('NO EXISTE EL PRODUCTO')
        }
    }//if

    else{

        new_request_array = row_update(is_on_array, code, qty, new_request_array, 1);

    }//else


}

function add_new_row(code, desc, qty, unit, id){

    let Btn_Confirm = $('.Btn_Confirm');

    new_request_array.push([code, qty, desc, unit, id]);

    var new_row=`<tr class="${code}">
            <td>${code}</td>
            <td>${desc}</td>
            <td style="padding:0; width:8%"><input type="number" style="width:100%;border:0px" 
            class="form-control ${code}_product_qty no_qty"/></td>
            <td style="width:6%">${unit}</td>
            <td style="text-align: center; padding:0; width:5%" class="inner-addon">
            <i class="fa fa-minus remove_row"></i></td>
            </tr>`;

    $('.table-body').append(new_row);

    $(`.${code}_product_qty`).val(qty);

    Btn_Confirm.show();

}

function row_update(row, code, qty, array, ctrl){

    var actual_qty = 0;
    var actual_uprice = 0;
    var new_qty = 0;
    var new_subt = 0;
    var new_disc = 0;
    var new_pudisc = 0;


    if (ctrl == 1){//means add already existing product on table

        actual_qty = array[row][1];


        new_qty = parseFloat(actual_qty) + parseFloat(qty);


    }

    if(ctrl == 2){//means update qty


        new_qty = parseFloat(qty);

    }


    //update values

    $(`.${code}_product_qty`).val(new_qty);


    array[row][1] = new_qty;



    return array;

}

function save_new_request(){

    save_detail();
    //new_request_array.push([code, qty, desc, unit, id]);
    $.ajax({
        method: "POST",
        url: "/api/requests/",
        async: false,

        data: JSON.stringify({
            "request_date": $('.new_request_date').val(),
            "request_project": $('.new_request_project').val(),
            "request_activity": $('.new_request_activity').val(),
            "request_product_list": new_request_detail,


        }),//JSON object
        contentType:"application/json; charset=utf-8",
        dataType:"json"
    })
        .fail(function(data){
            new_request_detail=[];
            console.log(data.responseText);
            alert("Hubo un problema al crear el pedido, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
        })
        .success(function(data){
            alert('Pedido guardado con exito');
            //window.open(`/orderpdf/${data.id}/`);
            window.location.replace("/admin/requests/request/");
        });//ajax

}

function save_detail(){

    new_request_detail=[];
    //new_request_array.push([code, qty, desc, unit, id]);
    $.each(new_request_array, function(i) {
        $.ajax({
            method: "POST",
            url: "/api/request_detail/",
            async: false,

            data: JSON.stringify({
                "request_detail_product": new_request_array[i][4],
                "request_detail_product_code": new_request_array[i][0],
                "request_detail_description": new_request_array[i][2],
                "request_detail_unit": new_request_array[i][3],
                "request_detail_amount": new_request_array[i][1],

            }),//JSON object
            contentType:"application/json; charset=utf-8",
            dataType:"json"
        })
            .fail(function(data){
                console.log(data.responseText);
                alertify.alert("Hubo un problema al crear el pedido, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
            })
            .success(function(data){
                new_request_detail.push(data.id);
            });//ajax
    });

}

function check_data_filled(){

    //SELECTORS
    var date = $('.new_request_date');
    var project = $('.new_request_project');
    var activity = $('.new_request_activity');
    var bool = false;


    if(!date.val()){
        bool = false;
        return bool
    }

    if(!project.val()){
        bool = false;
        alertify.alert('Debe Elegir un Proyecto');
        return bool
    }
    if(!activity.val()){
        bool = false;
        alertify.alert('Debe Elegir una Actividad');
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
function main_new_order () {

    //Selectors
    var html = $('html');

    var code = $('.request_product_code');
    var search = $('.new_request_search');
    var project = $('.new_request_project');
    var activity = $('.new_request_activity');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Edit = $('.Btn_Edit');
    var Btn_Save = $('.Btn_Save');

    new_request_array=[];
    new_request_detail=[];

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


        new_request_array.splice( rowIndex,1 );

        $(this).parent().parent().remove();

        if (new_request_array.length==0){
             Btn_Confirm.hide();
        }

    });

    html.on('click','.popup_product', function () {

        event.preventDefault();
        // var newwindow=window.open('/admin/products/product/add/?_popup=1','','height=700,width=600');
		PopupCenter('/admin/products/product/add/?popup', 'Agregar Producto', 500, 800)

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

        let code = new_request_array[rowIndex][0];
        let qty = $(`.${code}_product_qty`).val();


        row_update(rowIndex, code, qty, new_request_array, 2);


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

        save_new_request();

    });


    //Init Items

    search.select2({

        theme: "bootstrap",
        placeholder:"Busqueda...",
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
}

$(document).on('ready', function(){

    new_request();

});