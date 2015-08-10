class OrderController < ApplicationController
  def new_order
    products = []
    current_user.busket.busket_products.each do |p|
      products << {:product_name => p.product_name, :quantity => p.quantity, :product_id => p.product_id}
    end
    sum = 0
    product_list = ''
    products.each do |p|
    @calc = Product.where(:id => p[:product_id])
      @calc.each do |c|
        sum += c.price * p[:quantity]
        product_list += p[:product_name] + ', '
      end
    end
    @order = Order.create(:sum => sum, :is_paid => false, 
                          :user_id => current_user.id, :ordered_products => product_list)
  end
end
