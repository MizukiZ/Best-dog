class FeedBack < ApplicationRecord
  belongs_to :user
  belongs_to :breed

  def time_fomat
    self.created_at.strftime("%m/%d/%Y")
  end

end
