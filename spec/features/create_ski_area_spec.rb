require_relative '../spec_helper'

feature 'Create ski area page' do
  before do
    visit ski_areas_path
    click_on 'Create a Ski Area'
  end

  scenario 'User can see a create ski area form' do
    expect(page).to have_content("Create a Ski Area")
  end

  scenario 'User can create a ski area' do
    fill_in 'Ski Area Name', with: "Telluride"
    fill_in 'Country', with: "USA"
    fill_in 'State/Province', with: "CO"
    fill_in 'Logo URL', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
    click_on 'Create Ski Area'

    expect(page).to have_content("Telluride")
    expect(current_path).to eq(ski_areas_path)
  end

  scenario 'Create ski area page shows error if required field is blank' do
    fill_in 'Ski Area Name', with: ""
    fill_in 'Country', with: "USA"
    fill_in 'State/Province', with: "CO"
    fill_in 'Logo URL', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
    click_on 'Create Ski Area'

    expect(page).to have_content("Ski area name can't be blank")
  end
end
