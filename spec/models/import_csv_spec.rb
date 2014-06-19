require 'spec_helper'

describe ImportCsv do
  it 'saves a ski area record from the CSV into the database' do
data_file = <<-INDENTED_HEREDOC
ski_area_name,country,state,skiable_acres,logo_url
Telluride,USA,CO,"12,345",http://www.mjcomm.net/downloads/ski_logos/telluride.jpg
Big Sky,USA,MT,"13,579",http://www.mjcomm.net/downloads/ski_logos/big_sky.jpg
INDENTED_HEREDOC

    csv_data = ImportCsv.new(data_file).process

    expect(SkiArea.first.ski_area_name).to eq("Telluride")
  end
end
