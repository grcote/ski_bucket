class SecureTokens
  class InvalidPasswordResetToken < StandardError
  end

  def self.password_reset_for(user)
    verifier = Rails.application.message_verifier(:password_reset)
    verifier.generate({:user_id => user.id, expiration: 2.hours.from_now})
  end

  def self.verify_password_reset_token(token)
    verifier = Rails.application.message_verifier(:password_reset)
    begin
      decrypted_hash = verifier.verify(token)
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      raise InvalidPasswordResetToken
    end

    if Time.now < decrypted_hash[:expiration]
      decrypted_hash[:user_id]
    else
      raise InvalidPasswordResetToken
    end
  end

end