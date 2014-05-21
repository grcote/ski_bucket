def create_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Seth',
    :last_name => 'Geyer',
    :email => 'sethgeyer@example.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
  }

  attributes = default_attributes.merge(updated_attributes)

  User.create(attributes)
end