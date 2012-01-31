require 'spec_helper'

describe User do
  describe '#teacher?' do
    let(:user) { User.new }

    it "returns true if user is a teacher" do
      user.teacher = true
      user.teacher?.should be true
    end

    it "returns false if user is not a teacher" do
      user.teacher = false
      user.teacher?.should be false
    end
  end
end
