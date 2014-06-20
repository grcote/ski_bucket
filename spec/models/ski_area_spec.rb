require_relative '../spec_helper'

describe SkiArea do
  describe 'validations' do
    it 'ensures a valid ski area can be created' do
      ski_area = create_ski_area
      expect(ski_area).to be_valid
    end

    it 'ensures ski_area_name cannot be blank' do
      ski_area = create_ski_area(:ski_area_name => '')
      ski_area.valid?
      expect(ski_area.errors[:ski_area_name]).to match_array ["can't be blank"]
    end

    it 'ensures country cannot be blank' do
      ski_area = create_ski_area(:country => '')
      ski_area.valid?
      expect(ski_area.errors[:country]).to match_array ["can't be blank"]
    end

    it 'ensures state cannot be blank' do
      ski_area = create_ski_area(:state => '')
      ski_area.valid?
      expect(ski_area.errors[:state]).to match_array ["can't be blank"]
    end

    it 'ensures logo_url cannot be blank' do
      ski_area = create_ski_area(:logo_url => '')
      ski_area.valid?
      expect(ski_area.errors[:logo_url]).to match_array ["can't be blank"]
    end
  end
end
