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

    mail = ActionMailer::Base.deliveries.last
    @doc = Nokogiri::XML(mail.body.to_s)
    link = @doc.xpath("//a").first['href']

    visit link

    fill_in 'user[password]', with: 'newpassword'
    fill_in 'user[password_confirmation]', with: 'newpassword'
    click_on 'Reset Password'

    expect(page).to have_content("Success! Login with your updated password.")

    visit '/'
    fill_in 'Email', with: 'glennplake@skier.com'
    fill_in 'Password', with: 'newpassword'
    click_on 'Sign In'

    expect(page).to have_content("Hello Glenn, let's turn and burn!")
  end
end






