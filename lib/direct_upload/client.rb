require "aws-sdk-s3"

module DirectUpload
  class Client
    def self.connection
      @connection = ::Aws::S3::Resource.new(credentials)
    end

    def self.delete_folder(folder_name)
      objects = connection.bucket(DirectUpload.config.aws_bucket_name).objects(prefix: folder_name)
      objects.batch_delete!
    end

    private_class_method def self.credentials
      cred = Aws::Credentials.new(
        DirectUpload.config.aws_access_key_id,
        DirectUpload.config.aws_secret_access_key
      )

      {region: DirectUpload.config.aws_region, credentials: cred}
    end
  end
end
