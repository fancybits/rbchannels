# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "rbchannels/version"

Gem::Specification.new do |s|
  s.name        = 'rbchannels'
  s.version     = Channels::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ["Jon Maddox"]
  s.email       = 'jon@getchannels.com'
  s.homepage    = 'https://github.com/fancybits/rbchannels'
  s.summary     = 'API client for the Channels app - https://getchannels.com'
  s.description = 'API client for the Channels app - https://getchannels.com'

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'httparty', '~> 0.16.0'

  s.files         = ["lib/rbchannels.rb", "lib/rbchannels/version.rb"]
  s.test_files    = ["test/test_channels.rb"]
  s.require_paths = ["lib"]

end
