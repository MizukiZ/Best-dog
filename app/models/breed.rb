class Breed < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :feed_backs
end
