
//GLOBAL VARS
var expense_id = 0;
var project_id =0;

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

    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_order_supplier');

    add_from_API_to_select('projects', 'id','project_name', '.new_order_project');

    add_from_API_to_select('activities', 'id','activity_name', '.new_order_activity');

    // let id = JSON.parse(localStorage.order_to_edit);
    var id = getUrlParameter('id');

    $('.expense_header').text( `Editar Gasto # ${id}`);

    expense_id = id;

    main_edit_order();

    load_expense(id);

}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

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

function save_new_order(){

    $.ajax({
        method: "PUT",
        url: `/api/expenses/${expense_id}/`,
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

function load_expense(id) {


    $.get(`/api/expenses/${id}/`, function (data) {


    }).success(function (data){


        project_id = data.expense_project;

        $('.new_order_date').val(data.expense_date);

        $('.new_order_date_delivery').val(data.expense_bill_date);

        $('.new_order_supplier').val(data.expense_supplier).trigger("change");

        $('.project_val').val(project_id).trigger("change");

        $('.new_order_activity').val(data.expense_activity).trigger("change");

         $('.expense_detail').val(data.expense_description);

         $('.expense_document').val(data.expense_document);

         $('.expense_amount').val(data.expense_total);



    });



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
function main_edit_order () {


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
            $('.remove_row').addClass('unclickable');
            $('.add_note').addClass('unclickable');


            Btn_Confirm.hide();
            Btn_Edit.show().prop('disabled', false);
            Btn_Save.show().prop('disabled', false);

        }
    });

    Btn_Edit.on('click', function(event){
        event.preventDefault();

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


    setTimeout(function(){

        project.val(project_id).trigger("change");

    }, 1000);


}

$(document).on('ready', function(){

    edit_order();

});