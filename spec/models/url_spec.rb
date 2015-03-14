require 'rails_helper'
require 'byebug'

describe Url, type: :model do

  subject(:url) { FactoryGirl.build(:url) }

  describe "It is a valid url with link" do
    context "link is present" do
      it "should be a valid url" do
        expect(url).to be_valid
      end
    end
  end
end
