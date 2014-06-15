require 'spec_helper'

feature 'admin dashboard page' do
  scenario 'if user is not logged in they cannot access the dashboard page' do
  visit admin_dashboard_path

  expect(page).to have_content("You must be logged in as an admin to see this page")
  end

  scenario 'non-admin user is not allowed to login to dashboard page' do
    login_user
    visit admin_dashboard_path

    within('#flash_alert_wrapper') do
      expect(page).to have_content("You must be logged in as an admin to see this page")
    end
    expect(current_path).to eq(admin_login_path)
  end

  scenario 'admin user logs in and sees the dashboard page' do
    login_admin_user

    within('#flash_alert_wrapper') do
      expect(page).to have_content("Hello Bode, welcome to the Ski Bucket Admin Dashboard")
    end
  end
end
