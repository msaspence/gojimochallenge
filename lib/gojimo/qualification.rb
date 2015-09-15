require 'net/http'
require 'json'

module Gojimo
  class Qualification

    attr_accessor :id
    attr_accessor :title


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
      @title = options['title']
    end

  end
end
