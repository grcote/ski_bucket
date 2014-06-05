class Verifier

  def create_verifier
    @verifier = ActiveSupport::MessageVerifier.new(ENV['VERIFICATION_TOKEN'], serializer: YAML)
  end
end