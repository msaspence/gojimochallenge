require 'spec_helper'

describe '/index', type: :feature do

  subject { get('/').body }

  before :each do
    allow(Gojimo::Qualification).to receive(:all).and_return([
      Gojimo::Qualification.new({ 'id' => "1", 'name' => "Qualification 1" }),
      Gojimo::Qualification.new({ 'id' => "2", 'name' => "Qualification 2" }),
      Gojimo::Qualification.new({ 'id' => "3", 'name' => "Qualification 3" }),
    ])
  end

  it { is_expected.to have_content "Qualifications" }
  it { is_expected.to have_link "Qualification 1", '/qualification?id=1' }
  it { is_expected.to have_link "Qualification 2", '/qualification?id=2' }
  it { is_expected.to have_link "Qualification 3", '/qualification?id=3' }

end
