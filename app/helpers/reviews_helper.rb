module ReviewsHelper
  def star_rating(rating)
    return rating unless rating.is_a?(Fixnum)
    return "★"*rating + "☆"*(5 - rating)
  end
end
