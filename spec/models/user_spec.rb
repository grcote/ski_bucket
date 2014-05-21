require 'spec_helper'

describe User do
  it 'fails validation with no email address' do
    user = create_user(email: "")
    user.valid?
    expect(user.errors[:email]).to match_array ["can't be blank"]
  end

  it 'fails validation with a previously used email address' do
    create_user
    another_user = create_user
    another_user.valid?
    expect(another_user.errors[:email]).to match_array ["has already been taken"]
  end

  it 'should not be valid with a confirmation mismatch' do
    user = create_user(password_confirmation: "beta")
    user.valid?
    expect(user.errors[:password_confirmation]).to match_array ["doesn't match Password"]
  end
end
