require_relative '../spec_helper'

feature 'Create ski area page' do
  scenario 'User can see a create ski area form' do
    visit '/'
    click_on 'Create a Ski Area'

    expect(page).to have_content("Create a Ski Area")
  end
end