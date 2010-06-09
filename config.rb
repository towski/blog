$LOAD_PATH << './lib'

gem 'sinatra', "= 1.0"
require 'sinatra'

gem 'bson_ext', "= 1.0"
gem 'mongo_mapper', "= 0.7.6"
require 'mongo_mapper'

if $APP_ENV == "test"
	MongoMapper.database = 'blog_test'
else
	MongoMapper.database = 'blog'
end

gem "curb", "= 0.7.3"
require "curb"

require 'yajl'

gem 'resque'
require 'resque'

require 'blog'
if $APP_ENV == "production"
  Api.set :environment, :production
else
  Api.set :environment, :development
end
Api.set :public, File.dirname(__FILE__) + '/public'

