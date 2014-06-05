class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true


  def full_name
    "#{first_name} #{last_name}"
  end

  def reset_password_token
    token = Verifier.new.create_verifier
    token.generate({:user_id => self.id, expiration: 2.hours.from_now})
  end

  def send_password_reset
    Notifier.password_reset_email(self).deliver
  end

  def verify_user(token)
    decrypter = Verifier.new.create_verifier
    decrypted_hash = decrypter.verify(token)

    if Time.now < decrypted_hash[:expiration]
      @user = User.find(decrypted_hash[:user_id])
    else
      'expired_token'
    end

  rescue
    @user = nil
  end
end
