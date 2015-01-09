$(document).ready(function() {
    // Home
    $('.homeImages img').each(function() {
        $(this).imagesLoaded(function() {
            var width = $(this).width();
            var maxWidth = 520;
            if (width < maxWidth) {
                var offset = Math.round((maxWidth - width)/2);
                $(this).css('margin-left', offset);
            }
            else if (width > maxWidth) {
                var offset = Math.round((width - maxWidth)/2 * -1);
                $(this).css('margin-left', offset)
            }
        })
    })
})