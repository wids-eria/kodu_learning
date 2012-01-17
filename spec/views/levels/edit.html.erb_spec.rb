require 'spec_helper'

describe "levels/edit" do
  before(:each) do
    @level = assign(:level, stub_model(Level,
      :name => "MyString"
    ))
  end

  it "renders the edit level form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => levels_path(@level), :method => "post" do
      assert_select "input#level_name", :name => "level[name]"
    end
  end
end
