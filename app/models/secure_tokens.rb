class SecureTokens

  def self.password_reset_for(user)
    token = ActiveSupport::MessageVerifier.new(ENV['VERIFICATION_TOKEN'], serializer: YAML)
    token.generate({:user_id => user.id, expiration: 2.hours.from_now})
  end

end