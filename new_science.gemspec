require_relative 'lib/new_science/version'

Gem::Specification.new do |spec|
  spec.name          = "new_science"
  spec.version       = NewScience::VERSION
  spec.authors       = ["asif-kamal"]
  spec.email         = ["asif.kamal1489@gmail.com"]

  spec.summary       = %q{NSF discoveries.}
  spec.description   = %q{This Command Line Interface provides an easy way to access recent scientific discoveries made by the NSF.}
  spec.homepage      = "https://github.com/asif-kamal/CLI_Data_Gem_project.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  if spec.respond_to?(:metadata)
   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
 else
   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
 end

 spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
 spec.bindir        = "exe"
 spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
 spec.require_paths = ["lib"]

 spec.add_development_dependency "bundler", "~> 2.0"
 spec.add_development_dependency "rake", "~> 10.0"
 spec.add_development_dependency "rspec"
 spec.add_development_dependency "pry"

 spec.add_dependency "nokogiri"
 spec.add_dependency "colorize"
 spec.add_dependency "rainbow"

end
