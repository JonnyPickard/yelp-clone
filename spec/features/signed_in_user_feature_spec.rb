require 'rails_helper'

feature 'user deleting restaurant' do
  it 'can only be done by the creating user' do
    visit('/')
    sign_up
    create_restaurant
    click_link('Sign Out')
    sign_up_other
    click_link('Delete KFC')
    expect(page).to have_content('This is not your restaurant')
  end
end

feature 'user editing restaurant' do
  it 'can only be done by the creating user' do
    visit('/')
    sign_up
    create_restaurant
    click_link('Sign Out')
    sign_up_other
    click_link('Edit KFC')
    expect(page).to have_content('This is not your restaurant')
  end
end

feature 'user deleting review' do
  it 'can only be done by the creating user' do
    visit('/')
    sign_up
    create_restaurant
    review
    click_link('Sign Out')
    sign_up_other
    click_link('Delete review')
    expect(page).to have_content('This is not your review')
  end
end
