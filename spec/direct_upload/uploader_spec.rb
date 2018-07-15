module DirectUpload
  RSpec.describe Uploader do
    xit "should replace default params with next params" do
      obj = Uploader.new("file_path", "file_name", {connection: true}, expires: 100)
      expect(obj.options[:expires]).to eq(100)
    end

    xit "should clean up last / in path" do
      obj = Uploader.new("file_path", "file_name", {connection: true}, prefix_path: "path/with/stuff/")
      expect(obj.send(:s3_path)).to eq("path/with/stuff/file_name")
    end
    xit "should clean up first / in path" do
      obj = Uploader.new("file_path", "file_name", {connection: true}, prefix_path: "/path/with/stuff")
      expect(obj.send(:s3_path)).to eq("path/with/stuff/file_name")
    end
    it "should only let the correct options in" do
      expect {Uploader.new("file_path", "file_name", {connection: true}, not_approved_method: "something") }
        .to raise_error(Error::Uploader, "One or more of the option keys are not allowed: not_approved_method")
    end
  end
end