$(document).ready(function() {
    $('.account').live('mouseover', function() {
        $('#menu').show();
        return false;
    });
    $('#menu ul').live('mouseover', function() {
        return false;
    })
    $(document).live('mouseover', function() {
        $('#menu').hide();
    });
});