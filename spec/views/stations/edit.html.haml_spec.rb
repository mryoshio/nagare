require 'spec_helper'

describe "stations/edit" do

  before do
    assign(:places, [create(:at_entrance)])
    assign(:receivers, [create(:receiver01)])
    @station = assign(:station, create(:entrance_station))
  end

  it "renders the edit station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", station_path(@station), "post" do
      assert_select "select#station_place_id[name=?]", "station[place_id]"
      assert_select "select#station_receiver_id[name=?]", "station[receiver_id]"
    end
  end

end
