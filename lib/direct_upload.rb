require "direct_upload/version"
require "direct_upload/configuration"
require "direct_upload/client"
require "direct_upload/uploader"
require "direct_upload/csv"
require "direct_upload/error"

module DirectUpload
  class << self
    attr_writer :configuration

    def csv(arr, file_name, opts = {})
      file_path = DirectUpload::CSV.convert_to_file(arr, file_name)
      DirectUpload::Uploader.new(file_path, file_name, connection, opts).upload
    end

    # file_path can be a path or a file
    def file(file_or_file_path, file_name, opts = {})
      DirectUpload::Uploader.new(file_or_file_path, file_name, connection, opts).upload
    end
  end

  def self.config
    Configuration.instance
  end

  def self.configure
    yield config
  end

  def self.connection
    Client.connection
  end
end