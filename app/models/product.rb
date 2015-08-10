class Product < ActiveRecord::Base
  has_attached_file :image, styles: {icon: "30x30", list: "300x400"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :category
  has_many :product_comments
  has_many :product_tags
  has_many :tags, through: :product_tags
  delegate :name, to: :category, prefix: true
  has_many :busket_products
  has_many :buskets, through: :busket_product
  has_many :buskets
  has_many :orders
end
