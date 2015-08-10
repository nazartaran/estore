$(document).ready(function() {
  $('#item_busket').click(function(){
    var quantity = $(this).parent().find('#quantity').val(),
    product_id = $(this).parent().find('#name_id').val();
      $.ajax({
      type: "POST",
      data: {quantity: quantity, product_id: product_id},
      dataType: "JSON",
      url: '/busket/add'
    });
  });

  $('.delete_icon').click(function(){
    var item_id = $(this).attr("id"),
        parent = $(this).parents('tr');
        console.log(parent)
      $.ajax({
        type: "DELETE",
        data: {id: item_id},
        dataType: "JSON",
        url: "/busket/" + item_id,
        success: function(){
        }
      });
    $(parent).remove();
  });
}); 