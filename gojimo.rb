$:.unshift "#{File.dirname(__FILE__)}/lib"

require 'Haml'
require 'json'
require 'net/http'
require 'pry'
require 'sinatra'


require 'gojimo/qualification'
require 'gojimo/subject'

get '/' do
  @qualifications = Gojimo::Qualification.all
  haml :'qualifications/index'
end

get '/qualification' do
  @qualification = Gojimo::Qualification.find(params[:id])
  haml :'qualifications/show'
end


