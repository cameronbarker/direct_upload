module DirectUpload
  RSpec.describe Uploader do
    it 'should replace default params with next params' do
      obj = Uploader.new("file_path", "file_name", {connection: true}, {expires: 100})
      expect(obj.options[:expires]).to eq(100)
    end

    it 'should clean up last / in path' do
      obj = Uploader.new("file_path", "file_name", {connection: true}, {prefix_path: "path/with/stuff/"})
      expect(obj.send(:s3_path)).to eq("path/with/stuff/file_name")
    end
    it 'should clean up first / in path' do
      obj = Uploader.new("file_path", "file_name", {connection: true}, {prefix_path: "/path/with/stuff"})
      expect(obj.send(:s3_path)).to eq("path/with/stuff/file_name")
    end
  end
end