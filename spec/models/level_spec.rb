require 'spec_helper'

describe Level do
  describe 'name' do
    let(:level) { Level.new }

    it 'should be required' do
      level.should_not be_valid
    end

    it 'sets the error message when not present' do
      level.errors_on(:name).should == ["can't be blank"]
    end
  end
end
