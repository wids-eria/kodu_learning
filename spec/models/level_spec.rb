require 'spec_helper'

describe Level do
  it { should have_attached_file(:level_file) }
  it { should validate_attachment_presence(:level_file) }
  it { should validate_attachment_content_type(:level_file).
                allowing('application/octet-stream').
                rejecting('image/png', 'image/gif', 'text/plain', 'text/xml') }

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
