require 'spec_helper'

describe Bucket do
  describe 'validations' do
    it 'ensures a valid bucket can be created' do
      bucket = new_bucket
      expect(bucket).to be_valid
    end

    it 'ensures bucket name cannot be blank' do
      bucket = new_bucket(:name => '')
      bucket.valid?
      expect(bucket.errors[:name]).to match_array ["can't be blank"]
    end
  end
end