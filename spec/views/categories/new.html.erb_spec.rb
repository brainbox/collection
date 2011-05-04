require 'spec_helper'

describe "categories/new.html.erb" do
  before(:each) do
    assign(:category, stub_model(Category,
      :name => "MyString",
      :subcategory_id => 1
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => categories_path, :method => "post" do
      assert_select "input#category_name", :name => "category[name]"
      assert_select "input#category_subcategory_id", :name => "category[subcategory_id]"
    end
  end
end
