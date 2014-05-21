require 'spec_helper'

feature 'Create a user acount' do
  scenario 'User can create an account' do
    register_user(first_name: "Seth", last_name: "Geyer")
    expect(page).to have_content("Welcome Seth Geyer")
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
end