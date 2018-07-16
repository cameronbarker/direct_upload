
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "direct_upload/version"

Gem::Specification.new do |spec|
  spec.name          = "direct_upload"
  spec.version       = DirectUpload::VERSION
  spec.authors       = ["Cameron Barker"]
  spec.email         = ["barker.cameron@gmail.com"]

  spec.summary       = "Upload to AWS S3 from the model"
  spec.description   = "Upload to AWS S3 from the model"
  spec.homepage      = "https://github.com/cameronbarker/direct_upload"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "aws-sdk-s3", "~> 1.16"
end
