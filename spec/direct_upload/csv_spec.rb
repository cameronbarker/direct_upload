module DirectUpload
  RSpec.describe CSV do
    it 'converts array to temporary file' do
      arrs = [[1], [2], [3]]
      file_name = "csv_arr.csv"
      file_path = DirectUpload::CSV.convert_to_file(arrs, file_name)
      expect(Pathname.new(file_path)).to exist
      File.delete(file_path)
    end
  end
end
