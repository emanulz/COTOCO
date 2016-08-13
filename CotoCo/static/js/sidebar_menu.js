
    // $(".sidebar-nav a").on("click", function(){
    //    $(".sidebar-nav").find(".active").removeClass("active");
    //    $(this).parent().addClass("active");
    // });



     function initMenu() {
      $('#menu ul').hide();

      $('#menu ul').children('.current').parent().show();

      //$('#menu ul:first').show();

         $('#menu li a').click(
        function() {

            var checkElement = $(this).next();
            if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                //$('#menu ul:visible').slideUp('normal');
                checkElement.slideUp('normal');
                  return false;
            }
            if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                //$('#menu ul:visible').slideUp('normal');
                checkElement.slideDown('normal');
                return false;
            }

            $('li.active').removeClass('active');
            $('a[href="' + location.pathname + '"]').closest('li').addClass('active');
          }
        );

         $("#menu-toggle").click(function(e) {
             e.preventDefault();
             $("#wrapper").toggleClass("toggled");
         });

         $("#menu-toggle-2").click(function(e) {
             e.preventDefault();
             $("#wrapper").toggleClass("toggled-2");
             $('#menu ul').hide();
         });


         $('li.active').removeClass('active');
         $('a[href="' + location.pathname + '"]').closest('li').addClass('active');
         var checkIfActive = $('.active');

         if(checkIfActive.is('li') && checkIfActive.parents().is('ul')){

             $('#menu ul:visible').slideUp('normal');
             checkIfActive.parent().slideDown();

         }
      }
    $(document).ready(function() {



        initMenu();
    });