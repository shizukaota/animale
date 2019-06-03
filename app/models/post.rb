class Post < ApplicationRecord
	 attachment :image
	 belongs_to :user
	 belongs_to :store

	 validate :comment,  length: { in: 1..40}
end
