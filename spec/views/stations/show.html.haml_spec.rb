require 'spec_helper'

describe "stations/show" do

  before(:each) do
    @station = create(:entrance_station)
    render
  end

  subject { rendered }

  it "renders attribute" do
    expect(subject).to match(/#{@station.place.name}/)
    expect(subject).to match(/#{@station.receiver.name}/)
  end

end
