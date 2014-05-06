require_relative '../spec_helper'

feature 'Delete ski area' do

  scenario 'User can delete a ski area' do
    visit '/'
    click_on 'Create a Ski Area'
    fill_in 'Ski Area Name', with: "Telluride"
    fill_in 'Country', with: "USA"
    fill_in 'State/Province', with: "CO"
    fill_in 'Logo URL', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
    click_on 'Create Ski Area'
    expect(page).to have_content("Telluride")
    click_on "Telluride"
    click_on "Delete Ski Area"

    expect(page).to_not have_content("Telluride")
    expect(current_path).to eq(ski_areas_path)
  end
end
