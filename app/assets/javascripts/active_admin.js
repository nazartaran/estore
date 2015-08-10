#= require active_admin/base

$(document).ready(function(){
	$('#user_test').click(function(){
	    $("#user_password_input").toggle();
	    $("#user_password_confirmation_input").toggle();

	});
});