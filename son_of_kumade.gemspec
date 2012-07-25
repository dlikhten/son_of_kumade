# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "son_of_kumade/version"

Gem::Specification.new do |s|
  s.name        = "son_of_kumade"
  s.version     = SonOfKumade::VERSION
  s.authors     = ["Dmitry Likhten", "Doorsteps"]
  s.email       = ["dlikhten@gmail.com", "support@doorsteps.com"]
  s.homepage    = "http://doorsteps.com"
  s.summary     = %q{A script for easy deployment to heroku's Cedar stack}
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('heroku', '~> 2.0')
  s.add_dependency('rake', '>= 0.8.7')
  s.add_dependency('grit', '~> 2.5.0')

  s.add_development_dependency('rspec', '~> 2.6.0')
end
