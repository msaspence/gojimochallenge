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
            'title' => 'The first subject'
          },
          {
            'id' => 'second_subject',
            'title' => 'The second subject'
          }
        ]
      }),
    )
  end

  it { is_expected.to have_content "My Qualification" }
  it { is_expected.to have_content "Subjects" }
  it { is_expected.to have_content "The first subject" }
  it { is_expected.to have_content "The second subject" }

  context "when there are no subjects" do

  end

end
