class ProductComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  delegate :email , :to => :user
  has_many :nested_comments, foreign_key:'parent_id', class_name:'ProductComment' 
end
