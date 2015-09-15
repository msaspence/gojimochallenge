require 'net/http'
require 'json'

module Gojimo
  class Qualification

    attr_accessor :id
    attr_accessor :name


    def self.data
      JSON.parse(Net::HTTP.get('api.gojimo.net', '/api/v4/qualifications'))
    end

    def self.all
      self.data.map do |q|
        self.new q
      end
    end

    def initialize options
      @id = options['id']
      @name = options['name']
    end

  end
end
