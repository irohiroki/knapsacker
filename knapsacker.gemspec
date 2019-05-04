
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "knapsacker/version"

Gem::Specification.new do |spec|
  spec.name          = "knapsacker"
  spec.version       = Knapsacker::VERSION
  spec.authors       = ["Hiroki Yoshioka"]
  spec.email         = ["irohiroki@gmail.com"]

  spec.summary       = %q{Knapsack problem solver with a simple API}
  spec.description   = %q{Knapsacker is a Knapsack (combinatorial opimization) problem solver with Branch and bound algorithm.}
  spec.homepage      = "https://github.com/irohiroki/knapsacker"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
