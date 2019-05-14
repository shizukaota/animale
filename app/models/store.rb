class Store < ApplicationRecord
	attachment :image
	has_many :favorite,dependent: :destroy
	has_many :post,dependent: :destroy
	has_many :tagmap
	has_many :tag, through: :tagmap
	has_many :storeimages
	accepts_nested_attributes_for :storeimages, allow_destroy: true
    has_many :menus
    accepts_nested_attributes_for :menus, allow_destroy: true
    def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end
end
