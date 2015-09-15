require 'spec_helper'

describe Gojimo::Subject do

  describe '#initialize' do

    subject do
      Gojimo::Subject.new({
        'id' => 'my_id',
        'title' => 'A title',
        'subject' => [
          {
            'id' => 'first_subject',
            'title' => "The first subject"
          },
          {
            'id' => 'second_subject',
            'title' => "The second subject"
          },
        ]
      })
    end

    it "sets the id" do
      expect(subject.id).to eq 'my_id'
    end

    it "sets the title" do
      expect(subject.title).to eq 'A title'
    end

  end

end
