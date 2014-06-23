require 'spec_helper'

feature 'Admin of ski areas' do
  scenario 'Only a admin can visit the create a ski area page' do
    login_user
    visit admin_ski_areas_path

    within('#flash_alert_wrapper') do
      expect(page).to have_content("You must be logged in as an admin to see this page")
    end
  end

  scenario 'Admin can add a ski area' do
    login_admin_user
    click_on 'Ski Areas'
    click_on 'Create a Ski Area'
    fill_in 'Ski Area Name', with: 'Telluride'
    fill_in 'Country', with: 'USA'
    fill_in 'State/Province', with: 'CO'
    fill_in 'Logo URL', with: 'http://www.mjcomm.net/downloads/ski_logos/telluride.jpg'
    click_on 'Create Ski Area'

    within('.ski_area_container') do
      expect(page).to have_content("Telluride")
    end
    expect(current_path).to eq(admin_ski_areas_path)
  end

  scenario 'Admin can update a ski area' do
    create_ski_area
    login_admin_user
    click_on 'Ski Areas'
    click_on 'Telluride'
    click_on 'Update Ski Area'
    fill_in 'Ski Area Name', with: 'Crested Butte'
    click_on 'Update Ski Area'

    within('#ski_area_name') do
      expect(page).to have_content("Crested Butte")
    end
  end

  scenario 'Create ski area page shows error if required field is blank' do
    login_admin_user
    click_on 'Ski Areas'
    click_on 'Create a Ski Area'
    fill_in 'Ski Area Name', with: ''
    fill_in 'Country', with: 'USA'
    fill_in 'State/Province', with: 'CO'
    fill_in 'Logo URL', with: 'http://www.mjcomm.net/downloads/ski_logos/telluride.jpg'
    click_on 'Create Ski Area'

    expect(current_path).to eq(admin_ski_areas_path)
    within('#validation_error_wrapper') do
      expect(page).to have_content("Ski area name can't be blank")
    end
  end

  scenario 'Admin can delete a ski area' do
    create_ski_area
    login_admin_user
    click_on 'Ski Areas'
    expect(page).to have_content("Telluride")
    click_on 'Telluride'
    click_on 'Delete Ski Area'

    within('.ski_area_container') do
      expect(page).to_not have_content("Telluride")
      expect(current_path).to eq(admin_ski_areas_path)
    end
  end

  scenario 'Admin can upload a CSV of ski area data to the database' do
    login_admin_user
    click_on 'Ski Areas'
    within('#csv_upload_container') do
      page.attach_file("csv_file", 'spec/fixtures/ski_area_data.csv')
    end
    click_on 'Submit'

    within('#flash_alert_wrapper') do
      expect(page).to have_content("Congratulations, you've uploaded 2 ski area records")
    end
  end
end

