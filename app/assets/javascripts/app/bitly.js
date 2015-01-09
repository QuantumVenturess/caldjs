function bitly(long_url, name, tweet_id) {
    var login = 'quantumventuress';
    var api_key = 'R_e50b00dad1da8f68d696f04a09e68f65';
    $.getJSON("http://api.bitly.com/v3/shorten?callback=?", {
        "format": "json",
        "apikey": api_key,
        "login": login,
        "longUrl": long_url
    },
    function(response) {
        var bitlyRegex = /bit.ly/
        var origUrl = $('#' + tweet_id).attr('href');
        if (!origUrl.match(bitlyRegex)) {
            var twitterUrl = "https://twitter.com/intent/tweet?original_referer=&text="
            var linkName = name
            var shortUrl = response.data.url;
            if (shortUrl == undefined) {
                var newUrl = twitterUrl + linkName + "%20" + long_url
                $('#' + tweet_id).attr('href', newUrl);
            }
            else {
                var newUrl = twitterUrl + linkName + "%20" + shortUrl;
                $('#' + tweet_id).attr('href', newUrl);
            }
        }
    });
};

$(document).ready(function() {
    $('.twitterShare').live('mouseover', function() {
        var url = $(this).attr('href');
        var name = $(this).attr('name');
        var tweet_id = $(this).attr('id');
        bitly(url, name, tweet_id);
    })
    $('.twitterShare').live('click', function() {
        return false;
    })
})