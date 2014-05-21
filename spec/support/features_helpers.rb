def register_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Seth',
    :last_name => 'Geyer',
    :email => 'sethgeyer@example.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
  }

  attributes = default_attributes.merge(updated_attributes)

  visit '/'
  click_on 'Create Account'
  fill_in 'First Name', with: attributes[:first_name]
  fill_in 'Last Name', with: attributes[:last_name]
  fill_in 'Email', with: attributes[:email]
  fill_in 'Password', with: attributes[:password]
  fill_in 'Confirm Password', with: attributes[:password_confirmation]
  click_on 'Create Account'
end