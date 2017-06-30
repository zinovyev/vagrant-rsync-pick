# coding: utf-8
require_relative "lib/vagrant-rsync-pick/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-rsync-pick"
  spec.version       = VagrantPlugins::RsyncPick::VERSION
  spec.authors       = ["Ivan Zinovyev"]
  spec.email         = ["vanyazin@gmail.com"]

  spec.summary       = "Pick atomic changes from guest machine with rsync"
  spec.homepage      = "https://github.com/zinovyev/vagrant-rsync-pick"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|testdrive)/})
  end
  spec.bindir        = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
