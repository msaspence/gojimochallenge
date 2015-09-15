server:
	ruby gojimo.rb

shotgun:
	shotgun gojimo.rb --port 4567

test:
	rspec spec

setup:
	bundle install
