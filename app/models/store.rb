class Store < ApplicationRecord
	attachment :image
	has_many :favorites,dependent: :destroy
	has_many :posts,dependent: :destroy
	has_many :taggable
	has_many :storeimages,dependent: :destroy
	accepts_nested_attributes_for :storeimages, allow_destroy: true
    has_many :menus,dependent: :destroy
    accepts_nested_attributes_for :menus, allow_destroy: true
    acts_as_taggable_on :tags
    acts_as_taggable_on :tag_list
    has_many :base_tags, through: :taggings, source: :tag, class_name: '::ActsAsTaggableOn::Tag',dependent: :destroy


    validates  :storename, presence: true
    validates :city, presence: true
    validates :category, presence: true
    validates :system, presence: true
    validates :menu, presence: true
    validates :place, presence: true
    validates :phone_number, presence: true


    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
