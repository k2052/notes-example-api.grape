#!/usr/bin/env rake
require File.expand_path('../application', __FILE__)

if Notes.env == 'test'
	require 'rspec/core/rake_task'
	RSpec::Core::RakeTask.new(:spec)
	task :default => :spec
else 
	task :default => :seed
end

task :seed do
	testkey = ApiKey.find_by_access_token "TestKey"
	unless testkey
		account = Account.create(email: "test@test.com", role: 'test', username: 'test', password: 'bob')
		ApiKey.create access_token: "TestKey", account_id: account.id
	end

  Note.destroy_all()
	Note.create(id: "1", title: "Jogging in park")
	Note.create(id: "2", title: "Pick-up posters from post-office")
end
