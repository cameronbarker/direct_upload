require "csv"

module DirectUpload
  module CSV
    def self.convert_to_file(arrs, file_name)
      file_path = temp_csv_file_path(file_name)
      ::CSV.open(file_path, "wb") do |csv|
        arrs.each do |arr|
          csv << arr
        end
      end

      file_path
    end

    private_class_method def self.temp_csv_file_path(file_name)
      "#{File.expand_path('../../..', __dir__)}/tmp/#{file_name}"
    end
  end
end
