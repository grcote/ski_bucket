require 'spec_helper'

feature 'Create, Read, Update & Delete a Bucket' do

  feature 'User can Create a bucket' do
    scenario 'A logged-in user can create a ski bucket' do
      login_user
      click_on 'My Buckets'
      click_on 'Create Bucket'
      fill_in 'Bucket Name', with: 'My First Bucket'
      fill_in 'Description', with: 'This is my first ski bucket'
      click_on 'Create Bucket'

      #within('.page_section') do
      expect(page).to have_content("My First Bucket")
      #end

      within('#flash_alert_wrapper') do
        expect(page).to have_text("Bucket successfully created")
      end
    end
  end

  feature 'User can Read, Update and Delete their bucket' do
    before :each do
      user = create_user
      bucket = create_bucket(user_id: user.id)
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign In'
      click_on 'My Buckets'
      click_on 'Where I Want to Go'
    end

    scenario 'A logged-in user can see their ski bucket' do
      expect(page).to have_content("Where I Want to Go")
    end

    scenario 'A logged-in user can update their bucket' do
      click_on 'Update Bucket'
      fill_in 'Bucket Name', with: 'My Updated Bucket Name'
      click_on 'Update Bucket'

      expect(page).to have_content("My Updated Bucket Name")
      within('#flash_alert_wrapper') do
        expect(page).to have_text("Bucket updated")
      end
    end

    scenario 'A logged-in user can delete their bucket' do
      expect(page).to have_content("Where I Want to Go")
      click_on 'Delete Bucket'

      expect(page).to_not have_content("Where I Want to Go")
      within('#flash_alert_wrapper') do
        expect(page).to have_text("Bucket deleted")
      end
    end
  end

  feature 'Bucket validations' do
    scenario 'A logged-in user cannot create a bucket without a name' do
      login_user
      click_on 'My Buckets'
      click_on 'Create Bucket'
      fill_in 'Bucket Name', with: ''
      click_on 'Create Bucket'

      within('#validation_error_wrapper') do
        expect(page).to have_text("Name can't be blank")
      end
    end
  end
end
