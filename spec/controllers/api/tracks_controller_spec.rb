require 'spec_helper'

describe Api::TracksController do

  describe "POST 'record'" do
    before do
      post "record", valid_params
    end

    subject { JSON.parse(response.body) }

    context "without parameters" do
      let(:valid_params) { { } }
      it { expect(response).to be_success }
      it { expect(subject["status"]).to eq("error") }
    end

    context "with parameters" do
      let(:valid_params) { { beacon_uuid: "x-x", receiver_name: "A01" } }
      it { expect(response).to be_success }
      it { expect(subject["status"]).to eq("success") }
    end
  end

end
