
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "raise_to_slack/version"

Gem::Specification.new do |spec|
  spec.name          = "raise_to_slack"
  spec.version       = RaiseToSlack::VERSION
  spec.authors       = ["KUROKI Shinsuke"]
  spec.email         = ["shinsukekuroki@gmail.com"]

  spec.summary       = %q{Simply raise error messsage to slack}
  spec.homepage      = "https://github.com/skuroki/raise_to_slack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
end
