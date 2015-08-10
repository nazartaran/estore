class BusketController < ApplicationController
  before_filter :does_exist, :only => :add_item

  def add_item
    if does_exist == false
      @busket = BusketProduct.create(:product_id => params[:product_id], 
                                   :busket_id => current_user.busket_id, :quantity => params[:quantity])
    else
      @busket.update_attributes(:quantity => @busket.quantity + params[:quantity].to_f)
    end
    redirect_to :back
  end

  def does_exist
    @busket = BusketProduct.find_by(:product_id => params[:product_id], :busket_id => current_user.busket_id)
    @busket == nil ? false : true
  end

  def index
    @busket = Busket.find_by(:id => current_user.busket_id)
    @busket = BusketProduct.where(:busket_id => @busket.id)
  end

  def destroy
    @busket_product = BusketProduct.find_by(:id => params[:id])
    @busket_product.destroy
    render :nothing => true,  :status => 200
  end
end

