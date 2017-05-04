ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['CMS_ROOT'] ||= 'http://localhost:3001/'

require 'bundler/setup' # Set up gems listed in the Gemfile.
