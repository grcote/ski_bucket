def create_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Glenn',
    :last_name => 'Plake',
    :email => 'glennplake@skier.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
    :admin => false
  }

  attributes = default_attributes.merge(updated_attributes)

  User.create(attributes)
end

def create_admin_user(updated_attributes = {})
  default_attributes = {
    :first_name => 'Bode',
    :last_name => 'Miller',
    :email => 'bodemiller@skier.com',
    :password => 'iluvunicorns',
    :password_confirmation => 'iluvunicorns',
    :admin => true
  }

  attributes = default_attributes.merge(updated_attributes)

  User.create(attributes)
end

def create_ski_area(update_attributes = {})
  default_attributes = {
    :ski_area_name => 'Telluride',
    :country => 'USA',
    :state => 'CO',
    :skiable_acres => '12,345',
    :logo_url => 'http://www.mjcomm.net/downloads/ski_logos/telluride.jpg',
  }

  attributes = default_attributes.merge(update_attributes)

  SkiArea.create(attributes)
end

