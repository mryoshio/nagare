require 'spec_helper'

describe StationsController do

  login_as(:mike_user)

  let(:valid_session) { {} }
  let!(:station) { create(:entrance_station) }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:stations]).to eq([station]) }
  end

  describe "GET show" do
    before { get :show, { id: station.id }, valid_session }
    it { expect(assigns[:station]).to eq(station) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:station]).to be_a_new(Station) }
  end

  describe "GET edit" do
    before { get :edit, { id: station.id }, valid_session }
    it { expect(assigns[:station]).to eq(station) }
  end

  describe "POST create" do
    describe "with valid params" do
      let(:place)    { create(:at_entrance) }
      let(:receiver) { create(:receiver01) }
      let(:valid_attributes) { { place: place, receiver: receiver } }

      before { post :create, { station: valid_attributes }, valid_session }

      it { expect(assigns[:station]).to be_a(Station) }
      it { expect(assigns[:station]).to be_persisted }
      it { expect(response).to redirect_to(Station.last) }
    end

    describe "with invalid params" do
      before do
        Station.any_instance.stub(:save).and_return(false)
        post :create, { station: { "place_id" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:station]).to be_a_new(Station) }
      it { expect(response).to render_template("new") }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: station.id, station: { "place_id" => "1" } }, valid_session }

      it { expect(assigns[:station]).to eq(station) }
      it { expect(response).to redirect_to(station) }
    end

    describe "with invalid params" do
      before do
        Station.any_instance.stub(:save).and_return(false)
        put :update, { id: station.id, station: { "place_id" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:station]).to eq(station) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: station.id }, valid_session }

    it { expect(Station.count).to eq(0) }
    it { expect(response).to redirect_to(stations_url) }
  end

end
