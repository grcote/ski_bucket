require 'spec_helper'

feature 'a user can reset their password' do
  scenario 'A user can reset their password' do
    user = create_user
    mail_sent = ActionMailer::Base.deliveries.length
    visit '/'
    click_on 'Forgot Password?'
    fill_in 'Email', with: user.email
    click_on 'Reset Password'

    expect(ActionMailer::Base.deliveries.length).to eq(mail_sent + 1)
    expect(page).to have_content("Check the account you provided for instructions (#{user.email}).")
  end
end






