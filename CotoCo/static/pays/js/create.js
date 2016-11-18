/**
 * Created by emanuelziga on 11/10/16.
 */

var pay_details_array=[];
var total_debt = 0;
var total_pay = 0;
var interest = 0;

function new_pay() {

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

    date_to_today('.new_pay_date');
    add_from_API_to_select('suppliers', 'id','supplier_name', '.new_pay_supplier');


     main_new_pay();

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
    $(date_field_class).prop('disabled', true);
}

function fill_table(data) {

    $.each(data, function(i) {

        var debt = 0;

        if (data[i].bill_debt==null){
        debt = data[i].bill_total;
        }
        else{
        debt = data[i].bill_debt;
        }

        var new_row=`<tr class="${data[i].id}">
        <td>${data[i].id}</td>
        <td>${data[i].bill_supplier_bill}</td>
        <td class="price">${data[i].bill_total}</td>
        <td class="price">${debt}</td>
        <td style="padding:0; text-align:center"><input type="checkbox" class="complete chkcomp_${data[i].id}"/></td>
        <td style="padding:0; text-align:center"><input type="checkbox" class="incomplete chkincomp_${data[i].id}"/></td>
        <td style="padding:0;"><input disabled type="number" min="0" value="0" style="width:100%;border:0px" class="inc_pay_amount inc_pay_amount_${data[i].id} form-control"/></td>
        <td style="padding:0; width: 10%"><input disabled type="number" min="0" value="0" style="width:100%;border:0px" class="int_pay_amount int_pay_amount_${data[i].id} form-control"/></td>
        </tr>`;

        $('.table-body').append(new_row);

        pay_details_array.push([data[i].id, debt, false, false, 0, 0]);

        total_debt = total_debt+parseFloat(debt);

    });

    $('.total_debt').html(total_debt.toFixed(2));

    $('.total_remain').html((total_debt-total_pay).toFixed(2));

    $('.price').priceFormat({
        prefix: '₡ ',
        centsSeparator: ',',
        thousandsSeparator: '.'
    });


}

function val_changed(bill_id, clicked) {

    var control = -1;

    $.each(pay_details_array, function(i) {

        if (pay_details_array[i][0] == bill_id) {
            control = i;
        }
    });

    var complete_chk = $(`.chkcomp_${bill_id}`);
    var incomplete_chk = $(`.chkincomp_${bill_id}`);
    var amount_input = $(`.inc_pay_amount_${bill_id}`);
    var interest_input = $(`.int_pay_amount_${bill_id}`);


    interest_input.prop('disabled', false);


    var complete = false;
    var incomplete = false;

    if(clicked != 3 && clicked != 4) {


        if (complete_chk.is(":checked")) {

            complete = true;
        }

        if (incomplete_chk.is(":checked")) {

            incomplete = true;
        }

        /// EVENTS/////

        if (complete && !incomplete) { // MEANS COMPLETE CHECKED and incomplete not checked

            amount_input.prop('disabled', true);
            amount_input.val(pay_details_array[control][1]);
            pay_details_array[control][2] = true;
            pay_details_array[control][3] = false;
            pay_details_array[control][4] = 0;

        }

        if (!complete && incomplete) { // MEANS INCOMPLETE CHECKED and complete not checked
            complete_chk.prop("checked", false);
            amount_input.prop('disabled', false);
            amount_input.val(0);
            pay_details_array[control][2] = false;
            pay_details_array[control][3] = true;
            pay_details_array[control][4] = 0;

        }

        if (!complete && !incomplete) { // MEANS BOTH UNCHECKED

            amount_input.prop('disabled', true);
            interest_input.prop('disabled', true);
            amount_input.val(0);
            pay_details_array[control][2] = false;
            pay_details_array[control][3] = false;
            pay_details_array[control][4] = 0;
        }

        if (complete && incomplete && clicked == 1) { // check on complete, and incomplete was clicked

            incomplete_chk.prop("checked", false);
            amount_input.prop('disabled', true);
            amount_input.val(pay_details_array[control][1]);
            pay_details_array[control][2] = true;
            pay_details_array[control][3] = false;
            pay_details_array[control][4] = 0;

        }

        if (complete && incomplete && clicked == 2) { // check on incomplete, and complete was clicked

            complete_chk.prop("checked", false);
            amount_input.prop('disabled', false);
            amount_input.val(0);
            pay_details_array[control][2] = false;
            pay_details_array[control][3] = true;
            pay_details_array[control][4] = 0;


        }
    }

    if(clicked == 3) {

        if (amount_input.val() >= parseFloat(pay_details_array[control][1]) ){

            alertify.alert('Monto Mayor', 'El campo no puede ser mayor o igual al saldo de la factura, se cancelará la totalidad del saldo.');

            incomplete_chk.prop("checked", false);
            complete_chk.prop("checked", true);
            amount_input.prop('disabled', true);
            amount_input.val(pay_details_array[control][1]);

            pay_details_array[control][2] = true;
            pay_details_array[control][3] = false;
            pay_details_array[control][4] = 0;

        }

        else{

            pay_details_array[control][4] = amount_input.val();

        }



    }

    if(clicked == 4) {//MEANS UPDATE INTEREST VALUE

        if(interest_input.val()){

            pay_details_array[control][5] = parseFloat(interest_input.val());

        }
        else{
            pay_details_array[control][5] = 0;
        }


    }

    update_amounts();



}

function update_amounts() {

    total_pay = 0;

    interest = 0;

    $.each(pay_details_array, function(i) {

        interest = interest+parseFloat(pay_details_array[i][5]);

        if (pay_details_array[i][2] == true && pay_details_array[i][3] == false ) {
            total_pay = total_pay+parseFloat(pay_details_array[i][1]);
        }
        if (pay_details_array[i][2] == false && pay_details_array[i][3] == true ) {
            total_pay = total_pay+parseFloat(pay_details_array[i][4]);
        }


    });



    $('.total_remain').html((total_debt-total_pay).toFixed(2));
    $('.total_pay').html((total_pay).toFixed(2));
    $('.interest_amount').html(interest.toFixed(2));

    $('.deposit_amount').html((total_pay+interest).toFixed(2));




    $('.price').priceFormat({
        prefix: '₡ ',
        centsSeparator: ',',
        thousandsSeparator: '.'
    });


}

function previous_checks() {

    var supplier = $('.new_pay_supplier');
    var document = $('.doc_num');
    var notes = $('.pay_detail_text');

    if (!supplier.val() || supplier.val()==0){
        alertify.alert('Error', 'Debe Elegir un Proveedor');
        return false
    }

    if (total_pay <= 0){
        alertify.alert('Error', 'No hay facturas seleccionadas para el pago, el abono debe ser mayor a 0');
        return false
    }

    if (!document.val()){
        alertify.alert('Error', 'Debe Digitar un Número de documento');
        return false
    }

     if (!notes.val()){
        alertify.alert('Error', 'Debe digitar una nota');
        return false
    }

    alertify.confirm('Confirmar', `Desea registrar el depósito al proveedor ${supplier.text()} por un monto de ₡ ${(total_pay+interest).toFixed(2)}`, function () {


        save_pay();

    },  function () {})

}

function save_pay() {

    $.ajax({
        method: "POST",
        url: "/api/pays/",
        async: false,

        data: JSON.stringify({

            "pay_date": $('.new_pay_date').val(),
            "pay_supplier": $('.new_pay_supplier').val(),
            "pay_document_num": $('.doc_num').val(),
            "pay_notes": $('.pay_detail_text').val(),
            "pay_interest": interest,
            "pay_total": total_pay,
            "pay_last_debt": total_debt,
            "pay_actual_debt": parseFloat(total_debt-total_pay),
            "pay_deposit": parseFloat(total_pay+interest)

        }),//JSON object
        contentType:"application/json; charset=utf-8",
        dataType:"json"
    })
        .fail(function(data){
            console.log(data.responseText);
            alertify.alert('Error',"Hubo un problema al crear el pago, por favor intente de nuevo o contacte a Emanuel al # 83021964 " + data.responseText);
        })
        .success(function(data){

            save_details(data.id);

        });//ajax


}

function save_details(pay_id) {

    $.each(pay_details_array, function(i) {

        //IF ITS TOTAL PAY
        if (pay_details_array[i][2] == true && pay_details_array[i][3] == false ) {

            $.ajax({
            method: "POST",
            url: "/api/pays_details/",
            async: false,

            data: JSON.stringify({

            "pay_detail_pay": pay_id,
            "pay_detail_bill": pay_details_array[i][0],
            "pay_detail_last_debt": pay_details_array[i][1],
            "pay_detail_amount": parseFloat(pay_details_array[i][1]),
            "pay_detail_actual_debt": 0,
            "pay_detail_interest": parseFloat(pay_details_array[i][5])

            }),//JSON object
            contentType:"application/json; charset=utf-8",
            dataType:"json"
            })
            .fail(function(data){
                console.log(data.responseText);
                alertify.alert('Error',`Hubo un problema al crear el detalle de pago del la factura # ${pay_details_array[i][0]}, por favor intente de nuevo o contacte a Emanuel al # 83021964 \n ERROR>>>\n` + data.responseText);
            })
            .success(function(data){

                $.ajax({
                method: "PATCH",
                url: `/api/bills/${pay_details_array[i][0]}/`,
                async: false,

                data: JSON.stringify({

                    "bill_payed": true,
                    "bill_debt": 0

                }),//JSON object
                contentType:"application/json; charset=utf-8",
                dataType:"json"
                })
                .fail(function(data){
                    console.log(data.responseText);
                    alertify.alert('Error',`Hubo un problema al marcar como pagada la factura # ${pay_details_array[i][0]}, por favor intente de nuevo o contacte a Emanuel al # 83021964 \n ERROR>>>\n` + data.responseText);
                })
                .success(function(data){

                });//ajax

            });//ajax

        }

        //IF ITS PARTIAL PAY
        if (pay_details_array[i][2] == false && pay_details_array[i][3] == true && pay_details_array[i][4]>0) {

            $.ajax({
            method: "POST",
            url: "/api/pays_details/",
            async: false,

            data: JSON.stringify({

            "pay_detail_pay": pay_id,
            "pay_detail_bill": pay_details_array[i][0],
            "pay_detail_last_debt": parseFloat(pay_details_array[i][1]),
            "pay_detail_amount": parseFloat(pay_details_array[i][4]),
            "pay_detail_actual_debt": parseFloat(pay_details_array[i][1])-parseFloat(pay_details_array[i][4]),
            "pay_detail_interest": parseFloat(pay_details_array[i][5])

            }),//JSON object
            contentType:"application/json; charset=utf-8",
            dataType:"json"
            })
            .fail(function(data){
                console.log(data.responseText);
                alertify.alert('Error',`Hubo un problema al crear el detalle de pago del la factura # ${pay_details_array[i][0]}, por favor intente de nuevo o contacte a Emanuel al # 83021964 \n ERROR>>>\n` + data.responseText);
            })
            .success(function(data){

                $.ajax({
                method: "PATCH",
                url: `/api/bills/${pay_details_array[i][0]}/`,
                async: false,

                data: JSON.stringify({

                    "bill_half_payed": true,
                    "bill_debt": parseFloat(pay_details_array[i][1])-parseFloat(pay_details_array[i][4])

                }),//JSON object
                contentType:"application/json; charset=utf-8",
                dataType:"json"
                })
                .fail(function(data){
                    console.log(data.responseText);
                    alertify.alert('Error',`Hubo un problema al actualizar el saldo de la factura # ${pay_details_array[i][0]}, por favor intente de nuevo o contacte a Emanuel al # 83021964 \n ERROR>>>\n` + data.responseText);
                })
                .success(function(data){

                });//ajax

            });//ajax
        }
    });

    alertify.alert('COMPLETADO',`Pago # ${pay_id} Guardado con éxito, y montos actualizados correctamente.` , function(){
        //window.open(`/orderpdf2/${data.id}/`);
        window.location.replace("/admin/pays/pay/");
    });

}

function main_new_pay() {

    var supplier = $('.new_pay_supplier');
    var Btn_Select_Supplier = $('.Btn_Select_Supplier');
    var Btn_Pay_btn = $('.Btn_Pay');
    var html = $('html');


    Btn_Select_Supplier.on('click', function(event){

        event.preventDefault();

        pay_details_array=[];
        total_debt = 0;
        total_pay = 0;

        $('.total_debt').html(total_debt.toFixed(2));

        update_amounts();

        $(".table-body").html("");

        $.get(`/api/bills/?bill_supplier=${supplier.val()}&bill_payed=False`, function (data) {

        }).success(function(data){

            if(data.length!=0){

                fill_table(data);

            }

            else{
                alertify.alert('No hay Facturas', 'No existen Facturas Pendientes para ese proveedor')
            }


        });

    });

    Btn_Pay_btn.on('click', function(event){

        previous_checks();

    });


    $(document).on('change', '.complete', function() {

        var row=$(this).closest("tr");

        var bill_id = row.attr('class');

        val_changed(bill_id, 1);

    });

    $(document).on('change', '.incomplete', function() {

        var row=$(this).closest("tr");

        var bill_id = row.attr('class');

        val_changed(bill_id, 2);

    });

     $(document).on('change','.inc_pay_amount', function () {

        var row=$(this).closest("tr");

        var bill_id = row.attr('class');

        val_changed(bill_id, 3);

    });

     $(document).on('change','.int_pay_amount', function () {

        var row=$(this).closest("tr");

        var bill_id = row.attr('class');

        val_changed(bill_id, 4);

     });

     html.on('click','.view_debt_report', function () {

         event.preventDefault();

         var supplierId = $('.new_pay_supplier').val();


         if(supplierId){
            window.open(`/billdebts/${supplierId}/`, '_blank');
         }

     });

    html.on('click','.view_pays_report', function () {

         event.preventDefault();

         var supplierId = $('.new_pay_supplier').val();


         if(supplierId){
            window.open(`/payreport/${supplierId}/`, '_blank');
         }

     });


    supplier.select2({
        theme: "bootstrap",
        placeholder:"Seleccione...",
        width: '100%',
        allowClear: true,
        language: "es"
    });
}

$(document).on('ready', function(){

    new_pay();

});