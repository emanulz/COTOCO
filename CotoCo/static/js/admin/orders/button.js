/**
 * Created by emanuelziga on 31/7/16.
 */

(function($) {

$( document ).ready(function($){

    $('html').on('click','.pdfBtn', function () {
        event.preventDefault();
        var id=$(this).closest('tr')[0].cells[1].outerText;

        window.open(`/orderpdf/${id}/`)

    })

});

})(django.jQuery);