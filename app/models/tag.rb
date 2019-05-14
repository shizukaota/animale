class Tag < ApplicationRecord
	 has_many :tagmap
     has_many :store, through: :tagmap
end