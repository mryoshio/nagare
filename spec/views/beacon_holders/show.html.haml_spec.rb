require 'spec_helper'

describe "beacon_holders/show" do

  before do
    @beacon_holder = create(:taro_holder)
    render
  end

  subject { rendered }

  it "renders attribute" do
    expect(subject).to match(/#{@beacon_holder.beacon.name}/)
    expect(subject).to match(/#{@beacon_holder.patient.name}/)
  end

end
