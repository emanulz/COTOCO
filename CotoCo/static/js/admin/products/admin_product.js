/**
 * Created by emanuelziga on 17/6/16.
 */
(function($) {

    //GLOBAL VAR


    $(document).ready(function($) {



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
            if(settings.type == "DELETE"){
                xhr.setRequestHeader("X-CSRFToken", $('[name="csrfmiddlewaretoken"]').val());
            }
        }
    });//ajax setup

// SELECTORS

    var use_taxes = $('#id_product_usetaxes');
    var div_taxes = $('.field-product_taxes');

    var btn_save = $("[name='_save']");
    var btn_continue = $("[name='_continue']");
    var btn_another = $("[name='_addanother']");

    var code = $('#id_product_code');

    var product_department =  $('#id_product_department');
    var product_subdepartment =  $('#id_product_subdepartment');
    var consecutive =  $('#id_product_consecutive');

    var currentUrl = $(location).attr('href');

    var href = window.location.href;


    if (href.indexOf('popup') !== -1 ) {

        btn_save.addClass('pull-left')

    }


        
//SELECTORS END

    code.prop('disabled', true);

    btn_save.on('click', function () {

        code.prop('disabled', false);

    });

    btn_continue.on('click', function () {

        code.prop('disabled', false);

    });

    btn_another.on('click', function () {

        code.prop('disabled', false);

    });

    if (currentUrl.indexOf('change') == -1){
        product_department.val('');
        product_subdepartment.html('');
    }

    product_department.on('change', function () {

        product_subdepartment.html('');


        $.get(`/api/product_sub_departments/?productsubdepartment_department=${product_department.val()}`,
            function (data) {
                 $.each(data, function (i) {

                    product_subdepartment.append($('<option>', {
                        value: data[i].id,
                        text: `${data[i].productsubdepartment_code} - ${data[i].productsubdepartment_name}`
                    }));
                });

        }).success(function () {
            generateCode(code, product_department, product_subdepartment,consecutive);
        })

    });

    product_subdepartment.on('change', function () {
         generateCode(code, product_department, product_subdepartment,consecutive);
    });

    consecutive.on('change', function(){
         generateCode(code, product_department, product_subdepartment,consecutive);
    });

// FIELDS HIDE AND SHOW

//USE TAXES FIELDS
    if(use_taxes.is(':checked')==false){

        div_taxes.hide();

    }
    use_taxes.change(function() {//USE TAXES TOGGLE

        if(use_taxes.is(':checked')){
            div_taxes.show();
        }
        else {
            div_taxes.hide();
        }



    });// USE TAXES TOGGLE ENDS




    });//document ready closes


    function generateCode(code_field, department_field, subdepartment_field, consecutive_field){

        var formated;
        var subdepartment;
        var department;
        var consecutive;

        if (department_field.val() && subdepartment_field.val()) {

            $.get(`/api/product_departments/${department_field.val()}/`,
                function (data) {
                    department = data.productdepartment_code;
                }).success(function () {

                    $.get(`/api/product_sub_departments/${subdepartment_field.val()}/`,
                    function (data) {

                    }).success(function (data) {

                        subdepartment = data.productsubdepartment_code;

                        $.get(`/api/products/?product_subdepartment=${subdepartment_field.val()}`,function (data) {

                        }).success(function (data) {

                            var consecutives=[];

                            $.each(data, function (i) {

                            consecutives.push(data[i].product_consecutive)

                            });

                            consecutives.sort(function(a, b){return b-a});


                            consecutive = parseInt(consecutives[0])+1;

                            consecutive_field.val(consecutive);

                            formated = ('000' + consecutive).substr(-3);

                            if(department=='0'){
                                code_field.val(`${subdepartment}${formated}`);
                            }
                            else{
                                code_field.val(`${department}${subdepartment}${formated}`);
                            }

                        });

                });
            });
        }
        else{
            code_field.val(`0`);
        }


    }

    function getConsecutive() {

        var product_subdepartment =  $('#id_product_subdepartment');

        $.get(`/api/products/?product_subdepartment=${product_subdepartment.val()}`,function (data) {


        }).success(function (data) {

            var consecutives=[];

            console.log(data);

            $.each(data, function (i) {

                consecutives.push(data[i].product_consecutive)

            });

            consecutives.sort(function(a, b){return b-a});

            console.log(consecutives);

            console.log(parseInt(consecutives[0])+1);

            return(parseInt(consecutives[0])+1);

        });


    }




})(django.jQuery);