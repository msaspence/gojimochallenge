require 'spec_helper'

describe '/qualfication', type: :feature do

  subject { get('/qualification?id=my_id').body }

  before :each do
    allow(Gojimo::Qualification).to receive(:find).and_return(
      Gojimo::Qualification.new({
        'id' => "my_id",
        'name' => "My Qualification",
        'subjects' => [
          {
            'id' => 'first_subject',
            'title' => 'The first subject',
            'colour' => '#f00'
          },
          {
            'id' => 'second_subject',
            'title' => 'The second subject',
            'colour' => '#0f0'
          }
        ]
      }),
    )
  end

  it { is_expected.to have_content "My Qualification" }
  it { is_expected.to have_content "Subjects" }
  it { is_expected.to have_content "The first subject" }
  it { is_expected.to have_css ".subject.label[style='background-color: #f00']" }
  it { is_expected.to have_content "The second subject" }
  it { is_expected.to have_css ".subject.label[style='background-color: #0f0']" }

  context "when there are no subjects" do

  end

end
