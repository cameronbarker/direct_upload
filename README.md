# DirectUpload

Direct Upload creates a convenient way to upload and get urls for S3 buckets.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "direct_upload", :git => "git://github.com/cameronbarker/direct_upload.git"
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install direct_upload -l git://github.com/cameronbarker/direct_upload.git
```

## Configuration

```ruby
DirectUpload.configure do |config|
  config.aws_access_key_id = 'AWS_ACCESS_KEY_ID'
  config.aws_secret_access_key = 'AWS_SECRET_ACCESS_KEY'
  config.aws_bucket_name = 'AWS_BUCKET_NAME'
  config.aws_region = 'AWS_REGION'
end
```

## Usage

You can either upload a file or csv directly up to S3. The methods will return the string of a AWS S3 Url.

**File**

```ruby
DirectUpload.file("path/to/file", "filename.txt", s3_options = {})
DirectUpload.file(FileObject, "filename.txt", s3_options = {})
```

**CSV**

```ruby
csv_arr = [[arr, of, arrs], [arr, of, arrs]]
DirectUpload.csv(csv_arr, "filename.csv", s3_options = {})
```

## S3 Options

The below options can be passed through to `DirectUpload.file` or `DirectUpload.csv`.

Direct Upload comes with default parameters of `expires: Time.now.utc + (60 * 60 * 24 * 1), acl: "public-read"`.

`:prefix_path` (String) - Path within S3 bucket the file should be saved to. i.e. "BUCKETNAME/prefix_path/filename"  
`:multipart_threshold` (Integer) - default: 15728640 - Files larger than :multipart_threshold are uploaded using the S3 multipart APIs. Default threshold is 15MB.  
`:acl` (String) - The canned ACL to apply to the object.  
`:cache_control` (String) - Specifies caching behavior along the request/reply chain.  
`:content_disposition` (String) - Specifies presentational information for the object.  
`:content_encoding` (String) - Specifies what content encodings have been applied to the object and  
`:content_language` (String) - The language the content is in.  
`:content_type` (String) - A standard MIME type describing the format of the object data.  
`:expires` (Time) - The date and time at which the object is no longer cacheable.  
`:grant_full_control` (String) - Gives the grantee READ, READ_ACP, and WRITE_ACP permissions on the  
`:grant_read` (String) - Allows grantee to read the object data and its metadata.  
`:grant_read_acp` (String) - Allows grantee to read the object ACL.  
`:grant_write_acp` (String) - Allows grantee to write the ACL for the applicable object.  
`:metadata` (Hash) - A map of metadata to store with the object in S3.  
`:server_side_encryption` (String) - The Server-side encryption algorithm used when storing this object in S3  
`:storage_class` (String) - The type of storage to use for the object. Defaults to \'STANDARD\'.  
`:website_redirect_location` (String) - If the bucket is configured as a website, redirects requests for this  
`:sse_customer_algorithm` (String) - Specifies the algorithm to use to when encrypting the object (e.g.,  
`:sse_customer_key` (String) - Specifies the customer-provided encryption key for Amazon S3 to use in  
`:sse_customer_key_md5` (String) - Specifies the 128-bit MD5 digest of the encryption key according to RFC  
`:ssekms_key_id` (String) - Specifies the AWS KMS key ID to use for object encryption. All GET and  
`:request_payer` (String) - Confirms that the requester knows that she or he will be charged for the request. Bucket owners need not specify this parameter in their requests. Documentation on downloading objects from requester pays buckets can be found at http://docs.aws.amazon.com/AmazonS3/latest/dev/ObjectsinRequesterPaysBuckets.html  
`:tagging` (String) - The tag-set for the object. The tag-set must be encoded as URL Query  
`:use_accelerate_endpoint` (Boolean) - When true, the "https://BUCKETNAME.s3-accelerate.amazonaws.com" endpoint will be used.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cameronbarker/direct_upload. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DirectUpload project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cameronbarker/direct_upload/blob/master/CODE_OF_CONDUCT.md).
