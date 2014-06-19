class ImportCsv
require 'CSV'
  def initialize(data_file)
    @data_file_path = data_file
  end

  def read_csv
    CSV.read(@data_file_path, :headers => true, :header_converters =>:symbol, :converters => :all)
  end

  def convert_to_hashes
    return_array = []
    csv_array = read_csv
    csv_array.map { |row| return_array << row.to_hash }

    return_array
  end
end
