class Post < ApplicationRecord
	 attachment :image
	 belongs_to :user
	 belongs_to :store
end
