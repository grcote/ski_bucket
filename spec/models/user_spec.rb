require 'spec_helper'

describe User do
  it 'fails validation with no email address' do
    User.new(:email => "").should have(1).error_on(:email)
  end

  it 'fails validation with a previously used email address' do
    User.create(email: "seth@gmailer.com")
    User.new(email: "seth@gmailer.com").should have(1).error_on(:email)
  end
end
