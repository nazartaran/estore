class Busket < ActiveRecord::Base
  validates :user_id, uniqueness: true
  belongs_to :user
  has_many :busket_products
  has_many :products, through: :busket_product
  has_many :orders
end
