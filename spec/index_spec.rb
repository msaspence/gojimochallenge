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
  it { is_expected.to have_content "Qualification 1" }
  it { is_expected.to have_content "Qualification 2" }
  it { is_expected.to have_content "Qualification 3" }

end
