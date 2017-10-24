module FeedBacksHelper

  def star_fomat(rate)
    star_arr = []
    rate.times do
    star_arr << "⭐️"
    end
    star_arr.join("")
  end


end
