require 'spec_helper'

describe "subcategories/new.html.erb" do
  before(:each) do
    assign(:subcategory, stub_model(Subcategory,
      :name => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new subcategory form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subcategories_path, :method => "post" do
      assert_select "input#subcategory_name", :name => "subcategory[name]"
      assert_select "input#subcategory_category_id", :name => "subcategory[category_id]"
    end
  end
end
