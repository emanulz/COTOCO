/**
 * Created by emanuelziga on 2/8/16.
 */


(function($) {

    $( document ).ready(function($){

        // $('html').on('click','.pdfBtn', function () {
        //     event.preventDefault();
        //     var id=$(this).closest('tr')[0].cells[1].outerText;
        //
        //     window.open(`/orderpdf/${id}/`)
        //
        // });

        $('html').on('click','.editBtn', function () {

            var id=$(this).closest('tr')[0].cells[1].outerText;


            localStorage.bill_to_edit=JSON.stringify({id:id});


        });


    });

})(django.jQuery);