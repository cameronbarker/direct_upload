require 'csv'

module DirectUpload
  module CSV
    def self.convert_to_file(arrs, file_name)
      file_path = temp_csv_file_path(file_name)
      ::CSV.open(file_path, "wb") do |csv|
        arrs.each do |arr|
          csv << arr
        end
      end

      return file_path
    end

    private

    def self.temp_csv_file_path(file_name)
      "#{File.expand_path '../../..', __FILE__}/tmp/#{file_name}"
    end
  end
end