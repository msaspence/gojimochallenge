require 'spec_helper'

describe Gojimo::Qualification do

  describe '.data' do
    subject do
      Gojimo::Qualification.data
    end

    it "get data from api.gojimo.net/api/v4/qualifications" do
      stub_get = stub_request(:get, "http://api.gojimo.net/api/v4/qualifications").and_return(body: '[{"a":"b"}]')
      subject
      expect(stub_get).to have_been_requested
    end

    it "parses it as JSON" do
      stub_request(:get, "api.gojimo.net/api/v4/qualifications").and_return(body: '[{"a":"b"}]')
      expect(subject).to eq [{'a' => 'b'}]
    end

  end

  describe '.all' do

    subject do
      Gojimo::Qualification.all
    end

    before :each do
      allow(Gojimo::Qualification).to receive(:data).and_return [{'id' => "first_id"},{'id' => "last_id"}]
    end

    it "initializes a set of Gojimo::Qualification" do
      expect(subject.first).to be_a Gojimo::Qualification
      expect(subject.last).to be_a Gojimo::Qualification
    end
  end

  describe '#initialize' do
    subject do
      Gojimo::Qualification.new({
        'id' => 'my_id',
        'name' => 'A name'
      })
    end

    it "sets the id" do
      expect(subject.id).to eq 'my_id'
    end
    it "sets the name" do
      expect(subject.name).to eq 'A name'
    end
  end

end
