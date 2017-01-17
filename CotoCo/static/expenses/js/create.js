
//FUNCTIONS
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

    localStorage.Products=null;

    date_to_today('.new_order_date');

    date_to_today('.new_order_date_delivery');

    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_order_supplier');

    add_from_API_to_select('projects', 'id','project_name', '.new_order_project');

    add_from_API_to_select('activities', 'id','activity_name', '.new_order_activity');

    main_new_order();

}

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

function save_new_order(){

    $.ajax({
        method: "POST",
        url: "/api/expenses/",
        async: false,

        data: JSON.stringify({
            "expense_date": $('.new_order_date').val(),
            "expense_bill_date": $('.new_order_date_delivery').val(),
            "expense_supplier": $('.new_order_supplier').val(),
            "expense_project": $('.new_order_project').val(),
            "expense_activity": $('.new_order_activity').val(),
            "expense_document": $('.expense_document').val(),
            "expense_description": $('.expense_detail').val(),
            "expense_total": $('.expense_amount').val(),

        }),//JSON object
        contentType:"application/json; charset=utf-8",
        dataType:"json"
    })
        .fail(function(data){
            console.log(data.responseText);
            alertify.alert('Error',"Hubo un problema al crear el gasto, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
        })
        .success(function(data){
            window.open(`/expensepdf2/${data.id}/`);
            window.location.replace("/admin/expenses/expense/");
        });//ajax

}

function check_data_filled(){

    //SELECTORS
    var date = $('.new_order_date');
    var bill_date = $('.new_order_date_delivery');
    var supplier = $('.new_order_supplier');
    var project = $('.new_order_project');
    var activity = $('.new_order_activity');
    var detail = $('.expense_detail');
    var document = $('.expense_document');
    var amount = $('.expense_amount');
    var bool = false;


    if(!date.val()){
        bool = false;
        return bool
    }
    if(!bill_date.val()){
        bool = false;
        alertify.alert('Error en Fecha de factura','Debe Elegir una Fecha de la Factura del Proveedor');
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
    if(!detail.val()){
        bool = false;
        alertify.alert('Error en Detalle','Debe indicar un detalle del gasto');
        return bool
    }
    if(!document.val()){
        bool = false;
        alertify.alert('Error en Documento','Debe indicar un número de documento asociado, factura, recibo, etc..');
        return bool
    }
    if(!amount.val()){
        bool = false;
        alertify.alert('Error en el monto','Debe Indicar el monto del gasto');
        return bool
    }

    else{
        bool = true;
        return bool;
    }

}

// MAIN AND DOC READY
function main_new_order () {

    //Selectors
    var html = $('html');

    var supplier = $('.new_order_supplier');
    var project = $('.new_order_project');
    var activity = $('.new_order_activity');

    var Btn_Confirm = $('.Btn_Confirm');
    var Btn_Edit = $('.Btn_Edit');
    var Btn_Save = $('.Btn_Save');


    //Button Events
    Btn_Confirm.on('click', function(event){

        event.preventDefault();

        var bool;

        bool = check_data_filled();

        if (bool == true){

            $('.main-page-cont').find(':input').prop('disabled', true);

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
    Btn_Edit.hide();
    Btn_Save.hide();
}

$(document).on('ready', function(){

    new_order();

});