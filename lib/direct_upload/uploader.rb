require "csv"
# Direct Upload Options
# :prefix_path (String) - Path with in S3 bucket the file should be saved to.
# S3 Options
# :multipart_threshold (Integer) - default: 15728640 - Files larger than :multipart_threshold
#   are uploaded using the S3 multipart APIs. Default threshold is 15MB.
# :acl (String) - The canned ACL to apply to the object.
# :cache_control (String) - Specifies caching behavior along the request/reply chain.
# :content_disposition (String) - Specifies presentational information for the object.
# :content_encoding (String) - Specifies what content encodings have been applied to the object and
# :content_language (String) - The language the content is in.
# :content_type (String) - A standard MIME type describing the format of the object data.
# :expires (Time) - The date and time at which the object is no longer cacheable.
# :grant_full_control (String) - Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the
# :grant_read (String) - Allows grantee to read the object data and its metadata.
# :grant_read_acp (String) - Allows grantee to read the object ACL.
# :grant_write_acp (String) - Allows grantee to write the ACL for the applicable object.
# :metadata (Hash) - A map of metadata to store with the object in S3.
# :server_side_encryption (String) - The Server-side encryption algorithm used when storing this object in S3
# :storage_class (String) - The type of storage to use for the object. Defaults to \'STANDARD\'.
# :website_redirect_location (String) - If the bucket is configured as a website, redirects requests for this
# :sse_customer_algorithm (String) - Specifies the algorithm to use to when encrypting the object (e.g.,
# :sse_customer_key (String) - Specifies the customer-provided encryption key for Amazon S3 to use in
# :sse_customer_key_md5 (String) - Specifies the 128-bit MD5 digest of the encryption key according to RFC
# :ssekms_key_id (String) - Specifies the AWS KMS key ID to use for object encryption. All GET and
# :request_payer (String) - Confirms that the requester knows that she or he will be charged for the
#   request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects
#   from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html
# :tagging (String) - The tag-set for the object. The tag-set must be encoded as URL Query
# :use_accelerate_endpoint (Boolean) - When true, the "https://BUCKETNAME.s3-accelerate.amazonaws.com"
#   endpoint will be used.

module DirectUpload
  class Uploader
    APPROVED_OPTIONS = %i[
      multipart_threshold acl cache_control content_disposition content_encoding content_language
      content_type expires grant_full_control grant_read grant_read_acp grant_write_acp metadata
      server_side_encryption storage_class website_redirect_location sse_customer_algorithm
      sse_customer_key sse_customer_key_md5 ssekms_key_id request_payer tagging use_accelerate_endpoint prefix_path
    ].freeze

    attr_reader :options

    def initialize(file_path, file_name, s3_connection, opt={})
      assign_options(opt)
      @file_path = file_path.to_s
      @file_name = file_name.to_s
      @connection = s3_connection
    end

    def upload
      obj = @connection.bucket(DirectUpload.config.aws_bucket_name).object(s3_path)

      obj.upload_file(@file_path, @options)
      @url = obj.public_url.to_s
      @url
    end

    private

    def s3_path
      if @options[:prefix_path]
        prefix = @options[:prefix_path].to_s.chomp("/").reverse.chomp("/").reverse
        return "#{prefix}/#{@file_name}"
      end

      @file_name
    end

    def assign_options(opt)
      @options = {prefix_path: nil, expires: Time.now.utc + (60 * 60 * 24 * 1), acl: "public-read"}.merge(opt)

      extra_values = @options.keys - APPROVED_OPTIONS
      return if extra_values.empty?

      message = "One or more of the option keys are not allowed: #{extra_values.join(' ')}"
      raise(Error::Uploader, message)
    end
  end
end
