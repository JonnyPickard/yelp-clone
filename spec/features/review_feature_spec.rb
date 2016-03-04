require 'rails_helper'

describe 'review feature specs' do
  before {Restaurant.create name: 'KFC'}


  def leave_review(thoughts, rating)
    visit('/restaurants')
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    sign_up
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end
end
