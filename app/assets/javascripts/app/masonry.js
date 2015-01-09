$(document).ready(function() {
    var grid = $('.grid');
    grid.show();
    grid.masonry({
        itemSelector: '.photo',
        isFitWidth: true,
        gutterWidth: 20
    })
})