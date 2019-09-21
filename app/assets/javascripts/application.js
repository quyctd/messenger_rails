// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

scroll_bottom = function() {
    let message = $("#messages");
    if (message.length > 0) {
        message.scrollTop(message[0].scrollHeight);
    }
};

clear_submit = function() {
    $("#input-form").bind("ajax:complete", function(event,xhr,status){
        $('#message_body').val('');
    });
};

$(document).on('turbolinks:load', function() {
     $('.ui.dropdown').dropdown();
    scroll_bottom();
    $('.message .close').on('click', function() {
            $(this).closest('.message').transition('fade')
            ;
        })
    ;
    clear_submit();
});