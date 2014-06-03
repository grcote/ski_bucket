def create_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Glenn',
    :last_name => 'Plake',
    :email => 'glennplake@skier.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
  }

  attributes = default_attributes.merge(updated_attributes)

  User.create(attributes)
end