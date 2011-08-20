# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "currently/version"

Gem::Specification.new do |s|
  s.name        = "currently"
  s.version     = Currently::VERSION
  s.authors     = ["Mike Stipicevic"]
  s.email       = ["mike@stipicevic.com"]
  s.homepage    = "https://github.com/wickedchicken/i_am_currently"
  s.summary     = "the 'currently' concentration log application"
  s.description = <<-EOS
    'currently' is a console application designed to keep a running 'concentration log'
    of what you are currently doing in the moment. It is ideal for capturing your thoughts
    at work before the weekend so you're ready to go on Monday, or keeping you focused
    if you work in a distracting environment. 'currently' can save to a local file or
    connect to catch.com via its API
  EOS

  s.rubyforge_project = "currently"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
