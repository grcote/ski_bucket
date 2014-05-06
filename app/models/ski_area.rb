class SkiArea < ActiveRecord::Base

  validates :ski_area_name, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :logo_url, presence: true

end
