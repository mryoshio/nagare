require 'spec_helper'

describe Api::TracksController do
  describe "POST 'record'" do
    let!(:station)       { create(:entrance_station) }
    let!(:beacon_holder) { create(:taro_holder) }

    before { post "record", valid_params }
    subject { JSON.parse(response.body) }

    context "without parameters" do
      let(:valid_params) { { } }
      it { expect(response).to be_success }
      it { expect(subject["status"]).to eq("error") }
    end

    context "with parameters" do
      let(:valid_params) { {
          file: fixture_file_upload("track_sample.txt"),
          loc: station.receiver.name} }
      it { expect(response).to be_success }
      it { expect(subject["status"]).to eq("success") }
      it { expect(Track.count).to eq(1) }
    end
  end
end
