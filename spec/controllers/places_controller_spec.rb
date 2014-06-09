require 'spec_helper'

describe PlacesController do

  login_as(:mike_user)

  let(:valid_session) { {} }
  let!(:place) { create(:entrance_place) }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:places]).to eq([place]) }
  end

  describe "GET show" do
    before { get :show, { id: place.id }, valid_session }
    it { expect(assigns[:place]).to eq(place) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:place]).to be_a_new(Place) }
  end

  describe "GET edit" do
    before { get :edit, { id: place.id }, valid_session }
    it { expect(assigns[:place]).to eq(place) }
  end

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) { attributes_for(:living_place) }

      before { post :create, { place: valid_attributes }, valid_session }

      it { expect(assigns[:place]).to be_a(Place) }
      it { expect(assigns[:place]).to be_persisted }
      it { expect(response).to redirect_to(Place.last) }
    end

    describe "with invalid params" do
      before do
        Place.any_instance.stub(:save).and_return(false)
        post :create, { place: { "name" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:place]).to be_a_new(Place) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: place.id, place: { "name" => "MyString" } }, valid_session }

      it { expect(assigns[:place]).to eq(place) }
      it { expect(response).to redirect_to(place) }
    end

    describe "with invalid params" do
      before do
        Place.any_instance.stub(:save).and_return(false)
        put :update, { id: place.id, place: { "name" => "invalid value" } }, valid_session 
      end

      it { expect(assigns[:place]).to eq(place) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: place.id }, valid_session }

    it { expect(Place.count).to eq(0) }
    it { expect(response).to redirect_to(places_url) }
  end

end
