require 'spec_helper'
require 'byebug'

describe "Url", type: :model do
  let(:link) { FactoryGirl.build :url, link: 'google.com' }

end
