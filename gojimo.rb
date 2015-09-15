require 'Haml'
require 'sinatra'

get '/' do
  haml :'qualifications/index'
end
