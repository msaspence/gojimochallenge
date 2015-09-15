module Gojimo
  class Subject

    attr_accessor :id
    attr_accessor :title


    def initialize options
      @id = options['id']
      @title = options['title']
    end

  end
end
