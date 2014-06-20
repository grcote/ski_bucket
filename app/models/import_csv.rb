class ImportCsv

  def initialize(csv_string)
    @csv_string = csv_string
  end

  def process
    records_created = 0
    CSV.parse(@csv_string, :headers => true, :header_converters =>:symbol, :converters => :all) do |row|
      SkiArea.create!(
        :ski_area_name => row[:ski_area_name],
        :country => row[:country],
        :state => row[:state],
        :skiable_acres => row[:skiable_acres],
        :logo_url => row[:logo_url]
      )
      records_created += 1
    end
    records_created
  end
end
