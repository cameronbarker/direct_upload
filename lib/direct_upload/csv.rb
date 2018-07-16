require "csv"
require "tempfile"

module DirectUpload
  class CSV
    attr_reader :temp_file
    
    def initialize(arrs)
      @arrs = arrs
      @temp_file = nil
    end

    def convert_to_file
      temp_file = Tempfile.new()
      ::CSV.open(temp_file, "wb") do |csv|
        @arrs.each do |arr|
          csv << arr
        end
      end

      @temp_file = temp_file
    end

    def delete_file
      @temp_file.close
      @temp_file.unlink
    end
  end
end
