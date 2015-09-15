require 'Haml'
require 'pry'
require 'sinatra'

get '/' do
  haml :'qualifications/index'
end
