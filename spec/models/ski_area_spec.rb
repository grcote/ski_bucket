require_relative '../spec_helper'

describe SkiArea do
  describe 'validations' do
    before do
      @ski_area = SkiArea.new(ski_area_name: "Telluride", country: "USA", state: "CO", logo_url: "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg")
      expect(@ski_area).to be_valid
    end

    it '#ensures ski_area_name cannot be blank' do
      @ski_area.ski_area_name = ''
      expect(@ski_area).to_not be_valid
    end

    it '#ensures country cannot be blank' do
      @ski_area.country = ''
      expect(@ski_area).to_not be_valid
    end

    it '#ensures state cannot be blank' do
      @ski_area.state = ''
      expect(@ski_area).to_not be_valid
    end

    it '#ensures logo_url cannot be blank' do
      @ski_area.logo_url = ''
      expect(@ski_area).to_not be_valid
    end
  end
end
