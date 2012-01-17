require 'spec_helper'

describe "levels/new" do
  before(:each) do
    assign(:level, stub_model(Level,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new level form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => levels_path, :method => "post" do
      assert_select "input#level_name", :name => "level[name]"
    end
  end
end
