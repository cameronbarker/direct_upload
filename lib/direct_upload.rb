require "direct_upload/version"
require "direct_upload/configuration"
require "direct_upload/client"
require "direct_upload/uploader"
require "direct_upload/csv"
require "direct_upload/error"

module DirectUpload
  class << self
    attr_writer :configuration

    def csv(arr, file_name, opts={})
      csv = DirectUpload::CSV.new(arr)
      temp_file = csv.convert_to_file

      begin
        s3_url = DirectUpload::Uploader.new(temp_file, file_name, connection, opts).upload
      ensure
        csv.delete_file
      end

      s3_url
    end

    # file_path can be a path or a file
    def file(file_or_file_path, file_name, opts={})
      DirectUpload::Uploader.new(file_or_file_path, file_name, connection, opts).upload
    end

    def config
      Configuration.instance
    end

    def configure
      yield config
    end

    def connection
      Client.connection
    end
  end
end
