class BusketProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :busket
  delegate :name, :price, to: :product, prefix: true

end
