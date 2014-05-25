require 'spec_helper'

describe "receivers/edit" do
  before(:each) do
    @receiver = assign(:receiver, stub_model(Receiver,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit receiver form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", receiver_path(@receiver), "post" do
      assert_select "input#receiver_name[name=?]", "receiver[name]"
      assert_select "input#receiver_description[name=?]", "receiver[description]"
    end
  end
end
