module Gojimo
  class Qualification

    attr_accessor :id
    attr_accessor :name
    attr_accessor :subjects


    def self.data
      JSON.parse(Net::HTTP.get('api.gojimo.net', '/api/v4/qualifications'))
    end

    def self.all
      self.data.map do |q|
        self.new q
      end
    end

    def self.find id
      self.all.select{ |x| x.id == id }.first
    end

    def initialize options
      @id = options['id']
      @name = options['name']
      if options['subjects']
        @subjects = options['subjects'].map do |x|
          Gojimo::Subject.new x
        end
      end
    end

  end
end
