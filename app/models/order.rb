class Order < ActiveRecord::Base
require 'active_merchant'
include StripePayment
  belongs_to :user
  belongs_to :busket
  belongs_to :product
  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true

  def self.validation(credit_card, sum, orders)
    @callback = {}
    @callback[:errors] = []
    @credit_card = credit_card
    @sum = sum
    if @credit_card.validate.empty?
      @callback[:is_success] = true
    else
      @callback[:is_success] = false
      @callback[:errors] = credit_card.validate.each { |key, msg| "#{key.capitalize} #{msg.first}" } 
    end
    @callback = pay(credit_card, sum, orders, @callback)
  end

  def self.pay(credit_card, sum, orders, callback)
    if callback[:is_success]
      response = gateway.purchase(sum, credit_card)
      if response.success?
        orders.update_all(:is_paid => true) 
      end
    end
    callback
    rescue => e
      callback[:is_success] = false
      callback[:errors] << e.message
      return callback
  end

end
