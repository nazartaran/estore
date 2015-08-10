class BusketProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :busket
  delegate :name, to: :product, prefix: true
end
