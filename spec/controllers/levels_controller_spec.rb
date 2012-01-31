require 'spec_helper'

describe LevelsController do
  render_views

  let(:user) {User.create(:email => 'test@test.com', :password => 'Passw0rd')}
  let(:assignment) { Factory(:assignment) }
  let!(:level) { Factory(:level, :assignment => assignment) }
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in :user, user
  end
  
  def valid_attributes
    { name: 'My Awesome Level', level_file_file_name: 'my_awesome_file_name' }
  end

  describe "GET index" do
    it "assigns all levels as @levels" do
      get :index, :assignment_id => assignment.id
      assigns(:levels).should eq([level])
    end
  end

  describe "GET show" do
    it "assigns the requested level as @level" do
      get :show, :assignment_id => assignment.id, :id => level.to_param
      assigns(:level).should eq(level)
    end
  end

  describe "GET new" do
    it "assigns a new level as @level" do
      get :new, :assignment_id => assignment.id
      assigns(:level).should be_a_new(Level)
    end
  end

  describe "GET edit" do
    it "assigns the requested level as @level" do
      get :edit, :assignment_id => assignment.id, :id => level.to_param
      assigns(:level).should eq(level)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Level and assigns it to logged in user and assignment" do
        expect {
          post :create, :assignment_id => assignment.id, :level => valid_attributes
        }.to change(Level, :count).by(1)
        assigns(:level).user.should == user
        assigns(:level).assignment.should == assignment 
      end

      it "assigns a newly created level as @level" do
        post :create, :assignment_id => assignment.id, :level => valid_attributes
        assigns(:level).should be_a(Level)
        assigns(:level).should be_persisted
      end

      it "redirects to the created level" do
        post :create, :assignment_id => assignment.id, :level => valid_attributes
        response.should redirect_to(assignment_url(assignment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved level as @level" do
        # Trigger the behavior that occurs when invalid params are submitted
        Level.any_instance.stub(:save).and_return(false)
        post :create, :assignment_id => assignment.id, :level => {}
        assigns(:level).should be_a_new(Level)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Level.any_instance.stub(:save).and_return(false)
        post :create, :assignment_id => assignment.id, :level => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested level" do
        # Assuming there are no other levels in the database, this
        # specifies that the Level created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Level.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :assignment_id => assignment.id, :id => level.to_param, :level => {'these' => 'params'}
      end

      it "assigns the requested level as @level" do
        put :update, :assignment_id => assignment.id, :id => level.to_param, :level => valid_attributes
        assigns(:level).should eq(level)
      end

      it "redirects to the level" do
        put :update, :assignment_id => assignment.id, :id => level.to_param, :level => valid_attributes
        response.should redirect_to(level)
      end
    end

    describe "with invalid params" do
      it "assigns the level as @level" do
        # Trigger the behavior that occurs when invalid params are submitted
        Level.any_instance.stub(:save).and_return(false)
        put :update, :assignment_id => assignment.id, :id => level.to_param, :level => {}
        assigns(:level).should eq(level)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Level.any_instance.stub(:save).and_return(false)
        put :update, :assignment_id => assignment.id, :id => level.to_param, :level => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested level" do
      expect {
        delete :destroy, :assignment_id => assignment.id, :id => level.to_param
      }.to change(Level, :count).by(-1)
    end

    it "redirects to the levels list" do
      delete :destroy, :assignment_id => assignment.id, :id => level.to_param
      response.should redirect_to(assignment_url(assignment))
    end
  end
end
