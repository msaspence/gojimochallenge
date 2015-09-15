module Gojimo
  class Qualification

    attr_accessor :id
    attr_accessor :name
    attr_accessor :subjects
    attr_accessor :data


    def self.data
      # I could have cached the data in a local file or a DB
      # but given the size of the data set just storing in memory
      # is going to give the best results. It does require the API
      # to be online when the server is brought online though.
      @data ||= JSON.parse(Net::HTTP.get('api.gojimo.net', '/api/v4/qualifications'))
    end

    # Warms the cache up when the sever starts rather than on first request
    data unless ENV['ENV'] == 'test'

    def self.all
      @all = self.data.map do |q|
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
