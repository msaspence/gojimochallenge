require 'spec_helper'

describe Gojimo::Subject do

  describe '#initialize' do

    subject do
      Gojimo::Subject.new({
        'id' => 'my_id',
        'title' => 'A title',
        'colour' => '#f00'
      })
    end

    it "sets the id" do
      expect(subject.id).to eq 'my_id'
    end

    it "sets the title" do
      expect(subject.title).to eq 'A title'
    end

    it "sets the color" do
      expect(subject.color).to eq '#f00'
    end

  end

end
