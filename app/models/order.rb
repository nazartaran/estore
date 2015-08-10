class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :busket
  belongs_to :product
  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true
end
