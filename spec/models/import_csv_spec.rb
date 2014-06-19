require 'spec_helper'

describe ImportCsv do
  it 'imports a file and returns an array of headers and data' do
    data_file = '/Users/gerard/gSchoolWork/ski_bucket/spec/fixtures/ski_area_data.csv'
    csv_data = ImportCsv.new(data_file)

    expect(csv_data.read_csv.first.to_a).to eq([
      [:ski_area_name, "Telluride"],
      [:country, "USA"], [:state, "CO"],
      [:skiable_acres, "12,345"],
      [:logo_url, "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"]
    ])
  end

  it 'converts an array of symblol/value pairs from a CSV into an array of hashes' do
    data_file = '/Users/gerard/gSchoolWork/ski_bucket/spec/fixtures/ski_area_data.csv'
    csv_data = ImportCsv.new(data_file)

    expect(csv_data.convert_to_hashes).to match_array([{
      :ski_area_name => "Telluride",
      :country => "USA",
      :state => "CO",
      :skiable_acres => "12,345",
      :logo_url => "http://www.mjcomm.net/downloads/ski_logos/telluride.jpg"},
    {
      :ski_area_name => "Big Sky",
      :country => "USA",
      :state => "MT",
      :skiable_acres => "13,579",
      :logo_url => "http://www.mjcomm.net/downloads/ski_logos/big_sky.jpg"
    }])
  end

  it 'saves an ski area record from the CSV into the database' do
    data_file = '/Users/gerard/gSchoolWork/ski_bucket/spec/fixtures/ski_area_data.csv'
    csv_data = ImportCsv.new(data_file).convert_to_hashes
    new_ski_area = SkiArea.new(csv_data.first)
    new_ski_area.save!

    expect(SkiArea.find(new_ski_area.id).ski_area_name).to eq("Telluride")
  end
end
