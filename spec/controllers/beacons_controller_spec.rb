require 'spec_helper'

describe BeaconsController do

  login_as(:mike_user)

  let!(:beacon) { create(:navy_beacon) }

  let(:valid_attributes) { attributes_for(:blue_beacon) }
  let(:valid_session) { {} }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:beacons].size).to eq(1) }
  end

  describe "GET show" do
    before { get :show, { id: beacon.id }, valid_session }
    it { expect(assigns[:beacon]).to eq(beacon) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:beacon]).to be_a_new(Beacon) }
  end

  describe "GET edit" do
    before { get :edit, { id: beacon.id }, valid_session }
    it { expect(assigns[:beacon]).to eq(beacon) }
  end

  describe "POST create" do
    describe "with valid params" do
      before { post :create, { beacon: valid_attributes}, valid_session }

      it { expect(assigns[:beacon]).to be_a(Beacon) }
      it { expect(assigns[:beacon]).to be_persisted }
      it { expect(response).to redirect_to(Beacon.last) }
    end

    describe "with invalid params" do
      before do
        Beacon.any_instance.stub(:save).and_return(false)
        post :create, { beacon: { "uuid" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:beacon]).to be_a_new(Beacon) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: beacon.id, beacon: { "uuid" => "new-uuid" } }, valid_session }

      it { expect(assigns[:beacon]).to eq(beacon) }
      it { expect(response).to redirect_to(beacon) }
    end

    describe "with invalid params" do
      before do
        Beacon.any_instance.stub(:save).and_return(false)
        put :update, { id: beacon.id, beacon: { "uuid" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:beacon]).to eq(beacon) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: beacon.id }, valid_session }

    it { expect(Beacon.count).to eq(0) }
    it { expect(response).to redirect_to(beacons_url) }
  end

end
