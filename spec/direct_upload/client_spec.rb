module DirectUpload
  RSpec.describe Client do
    describe 'connection' do
      it '.connection gives AWS connection' do
        expect(DirectUpload::Client.connection).to be_kind_of(Aws::S3::Resource)
      end
    end
  end
end