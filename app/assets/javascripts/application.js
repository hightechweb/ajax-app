// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require twitter/bootstrap
//= require data-confirm-modal
//= require_tree .

// Custom error validation function for AJAX CRUD modals
// The validation errors will be shown on the #error_display div in _form.html.erb
$(document).ajaxError(function(event,xhr,options,exc) {

    var errors = JSON.parse(xhr.responseText);
    var er ='<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
    for(var i = 0; i < errors.length; i++){
        var list = errors[i];
        er += '<li>' + list + '</li>';
    }
    er+='</div>';
    $("#error_display").html(er);

});
