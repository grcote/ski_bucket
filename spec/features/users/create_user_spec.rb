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
    register_user
    register_user
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'User cannot create an account if password & confirmation do not match' do
    register_user(password_confirmation: "password")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'When a user successfully creates an account, they are logged in' do
    register_user
    expect(page).to have_content("Hello Seth, let's turn and burn!")
  end

  scenario 'User has option to login or create an account' do
    visit '/'
    expect(page).to have_content("Email")
    expect(page).to have_link("Sign Up")
  end
end