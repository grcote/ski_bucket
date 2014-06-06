class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :first_name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :email, format: { with: /([a-z\d._-]+)@([a-z\d._-]{2,}).([a-z\d._-]{3,})/i }


  def full_name
    "#{first_name} #{last_name}"
  end
end
