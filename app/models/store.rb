class Store < ApplicationRecord
	attachment :image
	has_many :favorites,dependent: :destroy
	has_many :posts,dependent: :destroy
	has_many :taggable
	has_many :storeimages
	accepts_nested_attributes_for :storeimages, allow_destroy: true
    has_many :menus
    accepts_nested_attributes_for :menus, allow_destroy: true
    acts_as_taggable_on :tags
    acts_as_taggable_on :tag_list
    has_many :base_tags, through: :taggings, source: :tag, class_name: '::ActsAsTaggableOn::Tag'
	    # scope :by_join_date,-> { order("created_at DESC") }


    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
