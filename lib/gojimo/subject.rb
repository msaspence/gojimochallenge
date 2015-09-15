module Gojimo
  class Subject

    attr_accessor :id
    attr_accessor :title
    attr_accessor :color


    def initialize options
      @id = options['id']
      @title = options['title']
      @color = options['colour']
    end

  end
end
