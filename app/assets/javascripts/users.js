$(document).ready(function(){
	$('#user_test').change(function(){
	  if ($(this).attr("checked")) {
        $('#user_password_input').show();
      }
      else {
      	$('#user_password_input').hide();
      }
      
	});
});