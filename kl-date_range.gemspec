# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'kl/date_range/version'

Gem::Specification.new do |spec|
  spec.name          = "kl-date_range"
  spec.version       = KL::DateRange::VERSION
  spec.authors       = ["Kenneth Leung"]
  spec.email         = ["kenneth@leungs.us"]

  spec.summary       = %q{To generate an array of dates when given the range of dates and step.}
  spec.description   = %q{To generate an array of dates when given the range of dates and step.}

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'http://leungs.us'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'activesupport'
end
