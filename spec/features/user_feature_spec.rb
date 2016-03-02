require 'rails_helper'

feature 'User can sign in and out' do

  context 'user not signed in' do
    it "should see a 'Sign in' link and a 'Sign up' link" do
      visit('/')
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Sign in')
    end

    it "should not see 'Sign Out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
    end
  end

  context 'user signed in on the home page' do

    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see a 'Sign Out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
    end

    it "should not see a 'Sign in' or 'Sign in' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
