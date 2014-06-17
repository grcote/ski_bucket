def register_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Glenn',
    :last_name => 'Plake',
    :email => 'glennplake@skier.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
  }

  attributes = default_attributes.merge(updated_attributes)

  visit root_path
  click_on 'Sign Up'
  fill_in 'First Name', with: attributes[:first_name]
  fill_in 'Last Name', with: attributes[:last_name]
  fill_in 'Email', with: attributes[:email]
  fill_in 'Password', with: attributes[:password]
  fill_in 'Confirm Password', with: attributes[:password_confirmation]
  click_on 'Create Account'
end

def login_user
  user = create_user
  visit root_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Sign In'
end

def login_admin_user
  admin_user = create_admin_user
  visit admin_login_path
  fill_in 'Email', with: admin_user.email
  fill_in 'Password', with: admin_user.password
  click_on 'Sign In'
end

def add_ski_area
  login_admin_user
  click_on 'Create a Ski Area'
  fill_in 'Ski Area Name', with: "Telluride"
  fill_in 'Country', with: "USA"
  fill_in 'State/Province', with: "CO"
  fill_in 'Logo URL', with: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"
  fill_in 'Skiable Acres', with: "12,345"
  click_on 'Create Ski Area'
end
