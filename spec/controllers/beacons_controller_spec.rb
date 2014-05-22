require 'spec_helper'

describe BeaconsController do

  login_as(:mike_user)
  let(:valid_session) { {} }
  let!(:beacon) { create(:navy_beacon) }

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
    it "assigns the requested beacon as @beacon" do
      beacon = Beacon.create! valid_attributes
      get :edit, {:id => beacon.to_param}, valid_session
      assigns(:beacon).should eq(beacon)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Beacon" do
        expect {
          post :create, {:beacon => valid_attributes}, valid_session
        }.to change(Beacon, :count).by(1)
      end

      it "assigns a newly created beacon as @beacon" do
        post :create, {:beacon => valid_attributes}, valid_session
        assigns(:beacon).should be_a(Beacon)
        assigns(:beacon).should be_persisted
      end

      it "redirects to the created beacon" do
        post :create, {:beacon => valid_attributes}, valid_session
        response.should redirect_to(Beacon.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved beacon as @beacon" do
        # Trigger the behavior that occurs when invalid params are submitted
        Beacon.any_instance.stub(:save).and_return(false)
        post :create, {:beacon => { "uuid" => "invalid value" }}, valid_session
        assigns(:beacon).should be_a_new(Beacon)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Beacon.any_instance.stub(:save).and_return(false)
        post :create, {:beacon => { "uuid" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested beacon" do
        beacon = Beacon.create! valid_attributes
        # Assuming there are no other beacons in the database, this
        # specifies that the Beacon created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Beacon.any_instance.should_receive(:update).with({ "uuid" => "MyString" })
        put :update, {:id => beacon.to_param, :beacon => { "uuid" => "MyString" }}, valid_session
      end

      it "assigns the requested beacon as @beacon" do
        beacon = Beacon.create! valid_attributes
        put :update, {:id => beacon.to_param, :beacon => valid_attributes}, valid_session
        assigns(:beacon).should eq(beacon)
      end

      it "redirects to the beacon" do
        beacon = Beacon.create! valid_attributes
        put :update, {:id => beacon.to_param, :beacon => valid_attributes}, valid_session
        response.should redirect_to(beacon)
      end
    end

    describe "with invalid params" do
      it "assigns the beacon as @beacon" do
        beacon = Beacon.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Beacon.any_instance.stub(:save).and_return(false)
        put :update, {:id => beacon.to_param, :beacon => { "uuid" => "invalid value" }}, valid_session
        assigns(:beacon).should eq(beacon)
      end

      it "re-renders the 'edit' template" do
        beacon = Beacon.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Beacon.any_instance.stub(:save).and_return(false)
        put :update, {:id => beacon.to_param, :beacon => { "uuid" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested beacon" do
      beacon = Beacon.create! valid_attributes
      expect {
        delete :destroy, {:id => beacon.to_param}, valid_session
      }.to change(Beacon, :count).by(-1)
    end

    it "redirects to the beacons list" do
      beacon = Beacon.create! valid_attributes
      delete :destroy, {:id => beacon.to_param}, valid_session
      response.should redirect_to(beacons_url)
    end
  end

end
