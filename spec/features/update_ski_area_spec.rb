require_relative '../spec_helper'

feature 'Update ski area page' do
  before do
    visit ski_areas_path
    click_on 'Create a Ski Area'
  end

  scenario 'User can update a ski areas information' do
    fill_in 'Ski Area Name', with: "Telluride"
    fill_in 'Country', with: "USA"
    fill_in 'State/Province', with: "CO"
    fill_in 'Logo URL', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
    click_on 'Create Ski Area'
    click_on "Telluride"
    click_on "Update Ski Area"

    fill_in 'Ski Area Name', with: "Crested Butte"
    click_on "Update Ski Area"

    expect(page).to have_content("Crested Butte")
  end

end
