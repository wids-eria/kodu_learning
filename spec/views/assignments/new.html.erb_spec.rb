require 'spec_helper'

describe "assignments/new" do
  before(:each) do
    assign(:assignment, stub_model(Assignment,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignments_path, :method => "post" do
      assert_select "input#assignment_title", :name => "assignment[title]"
      assert_select "textarea#assignment_description", :name => "assignment[description]"
    end
  end
end
