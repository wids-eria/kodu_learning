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

  describe '#gamer_tag' do
    it "should be unique" do
      user = Factory :user
      user2 = Factory.build :user, gamer_tag: user.gamer_tag
      user2.valid?
      user2.errors[:gamer_tag].should_not be_empty
    end
  end
end
