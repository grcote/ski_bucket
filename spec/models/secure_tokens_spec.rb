require 'spec_helper'

describe SecureTokens do
  include ActiveSupport::Testing::TimeHelpers

  let(:user) { User.new(id: 6) }
  let!(:token) {SecureTokens.password_reset_for(user)}

  it 'returns user id for a valid token' do
    expect(SecureTokens.verify_password_reset_token(token)).to eq 6
  end

  it 'raises InvalidPasswordResetToken when token is expired' do
    expect { SecureTokens.verify_password_reset_token(token + "abc") }.to raise_error(SecureTokens::InvalidPasswordResetToken)
  end

  it 'raises InvalidPasswordResetToken when token is expired' do
    travel_to(119.minutes.from_now) do
      expect(SecureTokens.verify_password_reset_token(token)).to eq 6
    end

    travel_to(120.minutes.from_now) do
      expect { SecureTokens.verify_password_reset_token(token) }.to raise_error(SecureTokens::InvalidPasswordResetToken)
    end
  end
end
