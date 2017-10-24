class Breed < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :feed_backs

  def reviewed_by?(user)
    self.feed_backs.exists?(user_id: user.id)
  end
end
