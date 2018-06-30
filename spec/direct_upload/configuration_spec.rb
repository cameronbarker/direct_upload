module DirectUpload
  RSpec.describe Configuration do
    after do
      DirectUpload.configure do |config|
        config.aws_region = "us-east-1"
      end
    end

    describe 'defaults' do
      it 'is a hash of default configuration' do
        expect(DirectUpload::Configuration.defaults).to be_kind_of(Hash)
      end
      it 'has region' do
        expect(DirectUpload.config.aws_region).to eq('us-east-1')
      end
    end

    it 'is callable from .configure' do
      DirectUpload.configure do |c|
        expect(c).to be_kind_of(DirectUpload::Configuration)
      end
    end

    describe 'attributes' do
      %w[aws_access_key_id aws_bucket_name aws_secret_access_key aws_region].each do |key|
        it "can set #{key} " do
          DirectUpload.configure do |config|
            config.send("#{key}=", '/awesome')
          end
          expect(DirectUpload.config.send(key)).to eq('/awesome')
        end
      end
    end


    describe 'missing connection variables' do
      after do
        DirectUpload.configure do |config|
          config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
          config.aws_bucket_name = ENV['AWS_BUCKET_NAME']
          config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
          config.aws_region = ENV['AWS_REGION']
        end
      end

      %w[aws_access_key_id aws_bucket_name aws_secret_access_key aws_region].each do |key|
        it "should throw and error if #{key} is nil" do
          DirectUpload.configure do |config|
            config.send("#{key}=", nil)
          end
          expect{DirectUpload.config.send(key)}.to raise_error(Error::Configuration, "DirectUpload missing: #{key}")
        end
      end
    end
  end
end
