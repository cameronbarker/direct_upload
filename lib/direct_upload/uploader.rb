require 'csv'

module DirectUpload
  class Uploader
    attr_reader :options
    def initialize(file_path, file_name, s3_connection, opt = {})
      @options = {
        prefix_path: nil,
        expires: Time.now + (60 * 60 * 24 * 1),
        acl: "public-read"
      }.merge(opt)

      @file_path = file_path.to_s
      @file_name = file_name.to_s
      @connection = s3_connection
    end

    def upload
      obj = @connection.bucket(DirectUpload.config.aws_bucket_name).object(s3_path)
      
      obj.upload_file(@file_path, @options)
      @url = obj.public_url.to_s
      return @url
    end

    private

    def s3_path
      if @options[:prefix_path]
        prefix = @options[:prefix_path].to_s.chomp("/").reverse.chomp("/").reverse
        return "#{prefix}/#{@file_name}"
      end

      return @file_name
    end
  end
end