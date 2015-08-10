class ProductCommentsController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def create
    @comment = ProductComment.new(com_autorize)
    @comment.user_id = current_user.id
    @comment.product_id = params[:product_id]
    @comment.parent_id = params[:product_comment][:parent_id].blank? ? nil : params[:product_comment][:parent_id]  
    if @comment.save
      redirect_to product_info_path(:category_id => params[:category_id], :id => params[:product_id])
    else
      render 'new'
    end
  end
  def index
    @comment = ProductComment.find_by(:id => params[:id])
  end

  private
  def com_autorize
    params.require(:product_comment).permit(:comment, :rate, :user_id, :product_id, :parent_id)
  end
end
