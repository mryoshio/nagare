require 'spec_helper'

describe "beacon_holders/index" do

  before do
    assign(:beacon_holders, [create(:taro_holder), create(:jiro_holder)])
  end

  it "renders a list of beacon_holders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: t('action.show'), count: 2
    assert_select "tr>td", text: t('action.edit'), count: 2
  end

end
