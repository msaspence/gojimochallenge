require 'Haml'
require 'pry'
require 'sinatra'

require 'gojimo/qualification'

get '/' do
  haml :'qualifications/index'
end
