class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :store, dependent: :destroy
  has_many :post, dependent: :destroy
  has_many :favorites, dependent: :destroy
  acts_as_paranoid
end
