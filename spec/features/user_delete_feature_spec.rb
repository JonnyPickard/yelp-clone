require 'rails_helper'

feature 'user deleting restuarant' do
  it 'can only be done by the creating user' do
    visit('/')
    sign_up
    create_restaurant
    click_link('Sign Out')
  end
end
