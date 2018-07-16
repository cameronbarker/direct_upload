RSpec.describe DirectUpload do
  it "has a version number" do
    expect(DirectUpload::VERSION).not_to be nil
  end

  it "it uploads csvs" do
    file_name = "TestFileName#{DateTime.now.strftime('%s')}.csv"
    expect(DirectUpload.csv([[1], [2]], file_name)).to eq("https://#{DirectUpload.config.aws_bucket_name}.s3.amazonaws.com/#{file_name}")
  end
  it "it uploads files" do
    file_path = "#{File.expand_path '../', __FILE__}/fixtures/file.txt"
    final_path = "https://#{DirectUpload.config.aws_bucket_name}.s3.amazonaws.com/file.txt"
    expect(DirectUpload.file(file_path, 'file.txt', {expires: (Time.now + 5)})).to eq(final_path)
  end
end
