$(document).ready(function() {
    $(window).scroll(function() {
        var next = $('.endlessPagination .next_page').attr('href');
        if (next && $(window).scrollTop() > $(document).height() - $(window).height() - 300) {
            $('.endlessPagination').replaceWith('<span class="loading"></span>');
            $.ajax({
                url: next,
                dataType: 'script'
            })
        }
    })
})