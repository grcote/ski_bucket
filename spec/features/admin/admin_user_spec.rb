require 'spec_helper'

feature 'Admin of users' do
  scenario 'if user is not logged in they cannot access the dashboard page' do
    visit admin_dashboard_path

    within('#flash_alert_wrapper') do
      expect(page).to have_content("You must be logged in as an admin to see this page")
    end
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

  scenario 'if admin is currently logged in and tries to access admin/login page, redirected to dashboard with message' do
    login_admin_user
    visit admin_login_path

    within('#flash_alert_wrapper') do
      expect(page).to have_content("You are already logged in as an admin")
    end
    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario 'admin can create new users' do
    login_admin_user
    visit admin_dashboard_path
    click_on 'Users'
    click_on 'Create User Account'
    fill_in 'First Name', with: 'Glenn'
    fill_in 'Last Name', with: 'Plake'
    fill_in 'Email', with: 'glennplake@skier.com'
    fill_in 'Password', with: 'iluvunicorns'
    fill_in 'Confirm Password', with: 'iluvunicorns'
    click_on 'Create Account'

    within ('#flash_alert_wrapper') do
      expect(page).to have_content("User successfully added")
    end

    within ('.page_section') do
      expect(page).to have_content("Glenn")
      expect(page).to have_content("Plake")
      expect(page).to have_content("glennplake@skier.com")
    end
    expect(current_path).to eq(admin_users_path)
  end

  scenario 'Only a admin can visit the create a user page in the Admin Dashboard section' do
    login_user
    visit admin_users_path

    within('#flash_alert_wrapper') do
      expect(page).to have_content("You must be logged in as an admin to see this page")
    end
  end
end
