require 'spec_helper'

describe Assignment do
describe 'title' do
    let(:assignment) {Assignment.new }

    it 'should be required' do
      assignment.should_not be_valid
    end

    it 'sets the error message when not present' do
      assignment.errors_on(:title).should == ["can't be blank"]
    end
  end

end
