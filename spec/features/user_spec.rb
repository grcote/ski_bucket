require 'spec_helper'

feature 'Create a user acount' do
  scenario 'User can create an account' do
    register_user(first_name: "Seth", last_name: "Geyer")
    expect(page).to have_content("Hello Seth, let's turn and burn!")
  end

  scenario 'User cannot create an account without an email' do
    register_user(email: "")
    expect(page).to have_content("Email can't be blank")
  end

  scenario 'User cannot create an account with an email already in use' do
    create_user
    register_user
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'User cannot create an account if password & confirmation do not match' do
    register_user(password_confirmation: "password")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'User cannot create an account with a password less than 6 characters' do
    register_user(password: "passwor", password_confirmation: "passwor")
    expect(page).to have_content("Password is too short")
  end

  scenario 'When a user successfully creates an account, they are logged in' do
    register_user
    expect(page).to have_content("Hello Glenn, let's turn and burn!")
  end

  scenario 'User has option to login or create an account' do
    visit root_path
    expect(page).to have_content("Email")
    expect(page).to have_link("Sign Up")
  end

  scenario 'A user can login' do
    login_user
    expect(page).to have_content("Hello Glenn, let's turn and burn!")
  end

  scenario 'A user can logout' do
    login_user
    click_on 'Logout'
    expect(page).to have_content("See you on the slopes!")
  end

  scenario 'A user can change their account email' do
    login_user
    click_on 'My Account'
    click_on 'Update Email'
    fill_in 'Enter new Email', with: "gp@bigair.com"
    click_on 'Update Email'
    expect(page).to have_content("Account email successfully updated to gp@bigair.com")
  end

  scenario 'A user can delete their account' do
    login_user
    click_on 'My Account'
    click_on 'Delete Account'
    expect(page).to have_content("Thanks and remember, there's no waiting for friends on a powder day!")
  end

  scenario 'A welcome email is sent to a new user' do
    mail_sent = ActionMailer::Base.deliveries.length
    register_user

    expect(ActionMailer::Base.deliveries.length).to eq(mail_sent + 1)
  end
end