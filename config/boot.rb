ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV'].to_sym || :development
