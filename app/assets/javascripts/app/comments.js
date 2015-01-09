$(document).ready(function() {
    $('.contactUs, .commentFormHeader').live('click', function() {
        var form = $('.commentForm');
        var up = $('.commentFormShow');
        var down = $('.commentFormHide');
        if (form.hasClass('show')) {
            form.animate({
                bottom: '-=211'
            }, 0, function() {
                form.removeClass('show')
            })
            up.show();
            down.hide();
        }
        else {
            form.animate({
                bottom: '+=211'
            }, 0, function() {
                form.addClass('show')
            })
            $('.commentForm .field input').focus();
            up.hide();
            down.show();
        }
        return false;
    })
    // Regex comment form
    $('#new_comment .action input').live('click', function() {
        var email = $('#new_comment .field input').val();
        var content = $('#new_comment .field textarea').val();
        var emailRegex = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/i
        if (email.length == 0 || !email.match(emailRegex)) {
            $('#new_comment .field input').focus();
            return false;
        }
        else if (content.length == 0) {
            $('#new_comment .field textarea').focus();
            return false;
        }
    })
})