require 'spec_helper'

feature 'Create a user acount' do
  before do
    visit '/'
    click_on 'Create Account'
  end

  scenario 'User can create an account' do
    fill_in 'First Name', with: "Seth"
    fill_in 'Last Name', with: "Gayer"
    fill_in 'Email', with: "imacoder@nerd.com"
    click_on 'Create Account'

    expect(page).to have_content("Welcome Seth Gayer")
  end

  scenario 'User cannot create an account without an email' do
    fill_in 'Email', with: ""
    click_on 'Create Account'

    expect(page).to have_content("Email can't be blank")
  end

  scenario 'User cannot create an account an email already in use' do
    fill_in 'Email', with: "imacoder@nerd.com"
    click_on 'Create Account'
    visit '/'
    click_on 'Create Account'
    fill_in 'Email', with: "imacoder@nerd.com"
    click_on 'Create Account'

    expect(page).to have_content("Email has already been taken")
  end
end