class SearchController < ApplicationController
  def index
    @tag = Tag.find_by(:title => params[:query])
    @product_to_tags = ProductTag.where(:tag_id => @tag.id).pluck('product_id')
    @product = Product.where(:id => @product_to_tags)
  end
end
