require 'spec_helper'

describe '/index', type: :feature do

  subject { get('/').body }

  it { is_expected.to have_content "Hello World" }

end
