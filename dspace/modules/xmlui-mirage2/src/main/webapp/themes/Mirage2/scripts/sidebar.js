/*
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */
(function ($) {

    function toggle_sidebar() {
        if ($('.row-offcanvas').hasClass('active')) {
            $('.row-offcanvas').removeClass('active').promise().done(function () {
                $('.main-content').css('min-height', 0).off('click', toggle_sidebar);
                window.setTimeout(function () {
                    $('#sidebar').removeAttr('style');
                }, 350);
            });


        } else {
            $('#sidebar').show();
            $('.row-offcanvas').addClass('active');
            $('.main-content').css('min-height', $('#sidebar').height());
            $('.main-content').on('click', toggle_sidebar);
        }

    }

    $(function () {
        $('[data-toggle=offcanvas]').on('click', toggle_sidebar).bind('touchend', function () {
            $(this).mouseout();
        });
    })

    var acc = document.getElementsByClassName("active");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active_accordion");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight){
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }

})(jQuery);