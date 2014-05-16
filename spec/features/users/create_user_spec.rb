require 'spec_helper'

feature 'Create a user acount' do
  scenario 'User can create an account' do
    visit '/'
    click_on 'Create Account'
    fill_in 'First Name', with: "Seth"
    fill_in 'Last Name', with: "Gayer"
    fill_in 'Email', with: "imacoder@nerd.com"
    fill_in 'Password', with: "iluvunicorns"
    fill_in 'Confirm Password', with: "iluvunicorns"
    click_on 'Create Account'

    expect(page).to have_content("Welcome Seth Gayer")
  end
end