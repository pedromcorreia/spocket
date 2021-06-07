class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :products
  has_many :integration_stores
  has_one :store

  def supplier?
    type == 'Supplier'
  end

  def retailer?
    type == 'Retailer'
  end
end
