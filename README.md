# DirectUpload

Direct Upload creates a convenient way to upload and get urls for S3 buckets.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "direct_upload", :git => "git://github.com/cameronbarker/direct_upload.git"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install direct_upload -l git://github.com/cameronbarker/direct_upload.git

## Usage

File
`DirectUpload.file("Path", "filename.txt", s3_options = {})`

CSV
`DirectUpload.csv([[arr, of, arrs], [arr, of, arrs]], "filename.csv", s3_options = {})`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cameronbarker/direct_upload. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DirectUpload project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cameronbarker/direct_upload/blob/master/CODE_OF_CONDUCT.md).
