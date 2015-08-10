class User < ActiveRecord::Base
	attr_accessor :test
  after_create :create_busket

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :product_comments
  has_one :busket
  delegate :id, to: :busket, prefix: true
  has_many :orders

  private
  def create_busket
    Busket.create(user_id: id)
  end

end
