include StripePayment
class OrderController < ApplicationController
  require 'active_merchant'
  before_filter :is_empty 

  def new_order
    if is_empty == true
      sum = 0
      product_list = ''     
      current_user.busket.busket_products.each do |p| 
        sum += p.product_price * p.quantity
        product_list += p.product_name + '; '
      end
      @order = Order.create(:sum => sum, :is_paid => false, 
                            :user_id => current_user.id, :ordered_products => product_list)
      current_user.busket.busket_products.destroy_all
      @orders = Order.where(:is_paid => false)
      render 'payment'
    else
      @orders = Order.where(:is_paid => false, :user_id => current_user.id)
      render 'payment'
    end
  end

  def payment
    @orders = Order.where(:is_paid => false, :user_id => current_user.id)
    @orders_for_payment = Order.where(:id => params[:order_ids])
    @sum = @orders_for_payment.sum(:sum)
    @credit_card = credit_card(params)
    @callback = Order.validation(@credit_card, @sum, @orders_for_payment)
    @callback[:is_success] ? flash[:notice]  = "Success" : flash[:error] = @callback[:errors]
    render 'payment', :orders => @orders
  end

  def is_empty
    current_user.busket.busket_products.count > 0 ? true : false
  end

end
