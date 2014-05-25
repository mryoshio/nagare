require 'spec_helper'

describe "receivers/new" do
  before(:each) do
    assign(:receiver, stub_model(Receiver,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new receiver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receivers_path, "post" do
      assert_select "input#receiver_name[name=?]", "receiver[name]"
      assert_select "input#receiver_description[name=?]", "receiver[description]"
    end
  end
end
