# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rtre/version"

Gem::Specification.new do |s|
  s.name        = "rtre"
  s.version     = Rtre::VERSION
  s.authors     = ["Benjamin Eckel"]
  s.email       = ["benjamin.eckel@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "rtre"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_dependency "ffi"
end
