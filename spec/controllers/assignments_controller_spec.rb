require 'spec_helper'

describe AssignmentsController do

  let(:user) {User.create(:email => 'test@test.com', :password => 'Passw0rd')}

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in :user, user
  end

def valid_attributes
    {title: 'First Assignment'}
end

  describe "GET index" do
    it "assigns all assignments as @assignments" do
      assignment = Assignment.create! valid_attributes
      get :index, {}
      assigns(:assignments).should eq([assignment])
    end
  end

  describe "GET show" do
    it "assigns the requested assignment as @assignment" do
      assignment = Assignment.create! valid_attributes
      get :show, {:id => assignment.to_param}
      assigns(:assignment).should eq(assignment)
    end
  end

  describe "GET new" do
    it "assigns a new assignment as @assignment" do
      get :new, {}
      assigns(:assignment).should be_a_new(Assignment)
    end
  end

  describe "GET edit" do
    it "assigns the requested assignment as @assignment" do
      assignment = Assignment.create! valid_attributes
      get :edit, {:id => assignment.to_param}
      assigns(:assignment).should eq(assignment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Assignment" do
        expect {
          post :create, {:assignment => valid_attributes}
        }.to change(Assignment, :count).by(1)
      end

      it "assigns a newly created assignment as @assignment" do
        post :create, {:assignment => valid_attributes}
        assigns(:assignment).should be_a(Assignment)
        assigns(:assignment).should be_persisted
      end

      it "redirects to the created assignment" do
        post :create, {:assignment => valid_attributes}
        response.should redirect_to(Assignment.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved assignment as @assignment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Assignment.any_instance.stub(:save).and_return(false)
        post :create, {:assignment => {}}
        assigns(:assignment).should be_a_new(Assignment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Assignment.any_instance.stub(:save).and_return(false)
        post :create, {:assignment => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested assignment" do
        assignment = Assignment.create! valid_attributes
        # Assuming there are no other assignments in the database, this
        # specifies that the Assignment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Assignment.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => assignment.to_param, :assignment => {'these' => 'params'}}
      end

      it "assigns the requested assignment as @assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => valid_attributes}
        assigns(:assignment).should eq(assignment)
      end

      it "redirects to the assignment" do
        assignment = Assignment.create! valid_attributes
        put :update, {:id => assignment.to_param, :assignment => valid_attributes}
        response.should redirect_to(assignment)
      end
    end

    describe "with invalid params" do
      it "assigns the assignment as @assignment" do
        assignment = Assignment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Assignment.any_instance.stub(:save).and_return(false)
        put :update, {:id => assignment.to_param, :assignment => {}}
        assigns(:assignment).should eq(assignment)
      end

      it "re-renders the 'edit' template" do
        assignment = Assignment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Assignment.any_instance.stub(:save).and_return(false)
        put :update, {:id => assignment.to_param, :assignment => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested assignment" do
      assignment = Assignment.create! valid_attributes
      expect {
        delete :destroy, {:id => assignment.to_param}
      }.to change(Assignment, :count).by(-1)
    end

    it "redirects to the assignments list" do
      assignment = Assignment.create! valid_attributes
      delete :destroy, {:id => assignment.to_param}
      response.should redirect_to(assignments_url)
    end
  end

end
