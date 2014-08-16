# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-useradd/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-useradd"
  spec.version       = VagrantPlugins::Useradd::VERSION
  spec.authors       = ["Jeff George"]
  spec.email         = ["jeff.george@gmail.com"]
  spec.summary       = %q{Inject users & groups into a Vagrant box prior to mounting synced_folders.}
  spec.description   = %q{Inject users & groups into a Vagrant box prior to mounting synced_folders.}
  spec.homepage      = "https://github.com/jeffgeorge/vagrant-useradd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
