require 'spec_helper'

describe CommentsController do
  let(:student) { Factory :student }
  let(:teacher) { Factory :teacher }
  let(:other_student) { Factory :student }
  let(:level) { Factory :level, user: student }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "#index" do
    it "allows teachers to view" do
      sign_in :user, teacher
      get :index, level_id: level.id
      response.should be_successful
    end

    it "allows level creator to view" do
      sign_in :user, student
      get :index, level_id: level.id
      response.should be_successful
    end

    it "doesn't allow other students" do
      sign_in :user, other_student
      lambda {
        get :index, level_id: level.id
      }.should raise_error(CanCan::AccessDenied)
    end
  end
end
