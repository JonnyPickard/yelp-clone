module ReviewsHelper
  def star_rating(rating)
    return "★"*rating + "☆"*(5 - rating)
  end
end
