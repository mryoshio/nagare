require 'spec_helper'

describe "stations/index" do

  before do
    assign(:stations, [create(:entrance_station), create(:living_station)])
  end

  it "renders a list of stations" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: t('action.show'), count: 2
    assert_select "tr>td", text: t('action.edit'), count: 2
  end

end
