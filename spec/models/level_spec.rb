require 'spec_helper'

describe Level do
  describe 'name' do
    it 'should be required' do
      level = Level.new
      level.valid?.should be_false
    end
  end
end
