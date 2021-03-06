require 'spec_helper'

describe Gojimo::Qualification do

  let (:first_qualification) { {
    'id' => "first_id",
    'name' => "First qualification"
  } }
  let (:last_qualification) { {
    'id' => "last_id",
    'name' => "Last qualification"
  } }

  describe '.data' do
    subject do
      Gojimo::Qualification.data
    end

    it "get data from api.gojimo.net/api/v4/qualifications" do
      stub_get = stub_request(:get, "https://api.gojimo.net/api/v4/qualifications").and_return(body: '[{"a":"b"}]')
      subject
      expect(stub_get).to have_been_requested
    end

    it "parses it as JSON" do
      stub_request(:get, "https://api.gojimo.net/api/v4/qualifications").and_return(body: '[{"a":"b"}]')
      expect(subject).to eq [{'a' => 'b'}]
    end

    context "when the server returns 304" do
      it "uses the cache" do
        stub_request(:get, "https://api.gojimo.net/api/v4/qualifications").and_return(body: '[{"a":"b"}]')
        Gojimo::Qualification.data
        stub_get = stub_request(:get, "https://api.gojimo.net/api/v4/qualifications")
          .with(headers: { 'If-Modified-Since' => /[A-Za-z]{3}, [0-9]{1,2} [A-Za-z]{3} [0-9]{4} [0-9]{2}\:[0-9]{2}\:[0-9]{2} (\-|\+)?[0-9]{4}/ })
          .and_return(status: 304)
        expect(Gojimo::Qualification.data).to eq [{'a' => 'b'}]
        expect(stub_get).to have_been_requested
      end
    end

  end

  describe '.all' do

    subject do
      Gojimo::Qualification.all
    end

    before :each do
      allow(Gojimo::Qualification).to receive(:data).and_return [first_qualification,last_qualification]
    end

    it "initializes a set of Gojimo::Qualification" do
      expect(subject.first).to be_a Gojimo::Qualification
      expect(subject.last).to be_a Gojimo::Qualification
    end

  end

  describe '.find' do

    subject do
      Gojimo::Qualification.find 'first_id'
    end

    before :each do
      allow(Gojimo::Qualification).to receive(:data).and_return [first_qualification, last_qualification]
    end

    it "finds the Gojimo::Qualification in question" do
      expect(subject).to be_a Gojimo::Qualification
      expect(subject.name).to eq "First qualification"
    end

  end

  describe '#initialize' do

    subject do
      Gojimo::Qualification.new({
        'id' => 'my_id',
        'name' => 'A name',
        'subjects' => [
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

    it "sets the name" do
      expect(subject.name).to eq 'A name'
    end

    it "initializes a set of Gojimo::Subject" do
      expect(subject.subjects.size).to eq 2
      expect(subject.subjects.first).to be_a Gojimo::Subject
    end

  end

end
