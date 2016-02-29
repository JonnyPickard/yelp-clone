require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add restuarant' do
      visit '/restaurants'
      expect(page).to have_content 'No restuarants yet'
      expect(page).to have_link 'Add a restuarants'
    end
  end
end
