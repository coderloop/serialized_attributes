# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "serialized_attributes/version"

Gem::Specification.new do |s|
  s.name        = "serialized_attributes"
  s.version     = SerializedAttributes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Federico Feroldi"]
  s.email       = ["federico@coderloop.com"]
  s.homepage    = ""
  s.summary     = %q{Create virtual attributes backed by a serialized field}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "serialized_attributes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
