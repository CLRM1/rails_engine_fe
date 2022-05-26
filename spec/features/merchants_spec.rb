require 'rails_helper'

RSpec.describe 'Merchants page' do

  # User Story - Merchants
  # As a visitor,
  # When I visit '/merchants' x
  # I should see a list of merchants by name
  # and when I click the merchant's name
  # I should be on page '/merchants/:id'
  # And I should see a list of items that merchant sells.
  it "text" do
    visit '/merchants'
    expect(page).to have_content('Merchants:')
    within "#merchants-#{merchant.id}" do
      expect(page).to have_content('Schroeder-Jerde')
    end
  end
end
