$(document).ready(function() {
  $(".nilstar").on({
    mouseover: function(){
    var id = $(this).attr("id");
    for(i=1;i<=parseInt(id);i++) {
      $("#" + i).removeClass("nilstar");
      $("#" + i).addClass("star");
    }
    },
     mouseleave: function(){
      for (i=1; i<=5; i++) {   
      $("#" + i).addClass("nilstar");
      $("#" + i).removeClass("star");
      } 
    },
    click: function(){
        $(this).off('mouseleave');
    }  
  });
  $(".nilstar").click(function(){
    var id = $(this).attr("id");
        $("#product_comment_rate").val(id);
    });

  $(".reply").click(function(){
    var id = $(this).attr("data-id");
    block = $(this).parents(".row").find(".append_reply");
    $.each(block, function(i, val) {
      if ($(val).attr("data-id") == id) {
        isset_form = $(val).find("form");
        if (isset_form.length == 0) {
          $(val).append('<form role="form" class="new_product_comment"'+
          ' id="new_product_comment" action="/category/'+category_id+'/product/'+product_id+'/comment?method=post"'+
          ' accept-charset="UTF-8" method="post"><div class="container-fluid" style="width:768px;">'+
          '<div class="form-group"><label class="sr-only control-label" for="product_comment_comment">'+
          'Comment</label><textarea placeholder="Leave a comment" cols="5" rows="4" class="form-control"'+
          ' name="product_comment[comment]" id="product_comment_comment"></textarea></div></div>'+
          '<input type="hidden" name="product_comment[parent_id]" id="product_comment_parent_id" value="'+id+'">'+
          '<input type="submit" name="commit" value="Comment" class="btn btn-primary"><br><br>'+
          '</form>');
          $(block).show();
        }
      }

    })  
  });

}); 