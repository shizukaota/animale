class Storeimage < ApplicationRecord
  attachment :image
  belongs_to :store
end
