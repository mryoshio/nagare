require 'spec_helper'

describe BeaconHoldersController do

  login_as(:mike_user)

  let(:valid_session)  { {} }
  let!(:beacon_holder) { create(:taro_holder) }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:beacon_holders]).to eq([beacon_holder]) }
  end

  describe "GET show" do
    before { get :show, { id: beacon_holder.id }, valid_session }
    it { expect(assigns[:beacon_holder]).to eq(beacon_holder) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:beacon_holder]).to be_a_new(BeaconHolder) }
  end

  describe "GET edit" do
    before { get :edit, { id: beacon_holder.id }, valid_session }
    it { expect(assigns[:beacon_holder]).to eq(beacon_holder) }
  end

  describe "POST create" do
    describe "with valid params" do
      let(:beacon) { create(:navy_beacon) }
      let(:patient) { create(:taro) }
      let(:valid_attributes) { { beacon: beacon, patient: patient } }

      before { post :create, { beacon_holder: valid_attributes }, valid_session }

      it { expect(assigns[:beacon_holder]).to be_a(BeaconHolder) }
      it { expect(assigns[:beacon_holder]).to be_persisted }
      it { expect(response).to redirect_to(BeaconHolder.last) }
    end

    describe "with invalid params" do
      before do
        BeaconHolder.any_instance.stub(:save).and_return(false)
        post :create, { beacon_holder: { "beacon_id" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:beacon_holder]).to be_a_new(BeaconHolder) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: beacon_holder.id, beacon_holder: { "beacon_id" => "1" } }, valid_session }

      it { expect(assigns[:beacon_holder]).to eq(beacon_holder) }
      it { expect(response).to redirect_to(beacon_holder) }
    end

    describe "with invalid params" do
      before do
        BeaconHolder.any_instance.stub(:save).and_return(false)
        put :update, { id: beacon_holder.id, beacon_holder: { "beacon_id" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:beacon_holder]).to eq(beacon_holder) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: beacon_holder.id }, valid_session }

    it { expect(BeaconHolder.count).to eq(0) }
    it { expect(response).to redirect_to(beacon_holders_url) }
  end

end
