module DirectUpload
  RSpec.describe CSV do
    it 'converts array to temporary file' do
      arrs = [[1], [2], [3]]
      csv = DirectUpload::CSV.new(arrs)
      temp_file = csv.convert_to_file
      expect(Pathname.new(temp_file.path)).to exist
    end

    it 'remove file' do
      arrs = [[1], [2], [3]]
      csv = DirectUpload::CSV.new(arrs)
      temp_file = csv.convert_to_file
      csv.delete_file
      expect(temp_file.path).to eq(nil)
    end
  end
end
