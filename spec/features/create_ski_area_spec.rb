require_relative '../spec_helper'

feature 'Create ski area page' do
  before do
    visit '/'
    click_on 'Create a Ski Area'
  end

  scenario 'User can see a create ski area form' do
    expect(page).to have_content("Create a Ski Area")
  end

  scenario 'User can create a ski area' do
    fill_in 'ski_area[ski_area_name]', with: "Telluride"
    fill_in 'ski_area[country]', with: "USA"
    fill_in 'ski_area[state]', with: "CO"
    fill_in 'ski_area[logo_url]', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
    click_on 'Create Ski area'

    expect(page).to have_content("Telluride")
    expect(current_path).to eq(ski_areas_path)
  end
end