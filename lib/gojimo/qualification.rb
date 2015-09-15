module Gojimo
  class Qualification

    attr_accessor :id
    attr_accessor :name
    attr_accessor :subjects
    attr_accessor :data
    attr_accessor :data_cached_at


    def self.uri
      @uri ||= URI.parse('https://api.gojimo.net/api/v4/qualifications')
    end

    def self.retrieve_data
      request = Net::HTTP::Get.new(uri.request_uri)
      if !@data.nil? && !@data_cached_at.nil?
        request.add_field("If-Modified-Since", @data_cached_at.rfc822)
      end
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(request)
    end

    def self.data
      response = retrieve_data
      if response.code != "304" || @data.nil?
        # I could have cached the data in a local file or a DB
        # but given the size of the data set just storing in memory
        # is going to give the best results. One con: It doesn't provide any
        # redundency if the API is down and the server is restarted.
        @data = JSON.parse response.body
        @data_cached_at = DateTime.now
      end
      @data
    end

    # Warms the cache up when the sever starts rather than on the first request
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
