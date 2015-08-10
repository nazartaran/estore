class ProductsController < ApplicationController
  def index
  	@product = Product.where(:category_id => params[:category_id])
  end
  def show
  	@product = Product.find_by(:category_id => params[:category_id], :id => params[:id])
    @comment = ProductComment.new
    @comments = ProductComment.where(:product_id => params[:id], :parent_id => nil)
    
    @tags_array = []
    @product_tags = Product.find_by(:category_id => params[:category_id], :id => params[:id]).tags
    @product_tags.each do |p|
      @tags_array << {:id => p.id, :title => p.title}
    end
  end
  def tags_url

  end
end
