$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'Haml'
require 'pry'
require 'sinatra'

require 'gojimo/qualification'

get '/' do
  @qualifications = Gojimo::Qualification.all
  haml :'qualifications/index'
end
