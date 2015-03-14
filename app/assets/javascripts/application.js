// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $(".shortener_form").submit(function (e) {
        e.preventDefault();

        $.ajax({
            type: 'POST',
            url: '/urls',
            data: $(this).serialize(),
            dataType: 'JSON',
            success: function(result) {
                console.log(result);
                display_shortlink(result);
            },
            error: function(err) {
                display_error_message(err);
            }
        });
    });
});

function display_shortlink(data) {
    $('<a>', {
        text:'Here is your shortened link',
        href: window.location.href + data.short_link
    }).appendTo($(".display_link"));
}

function display_error_message(err) {
    console.log(err);
    $("#notice").append("Invalid request");
}