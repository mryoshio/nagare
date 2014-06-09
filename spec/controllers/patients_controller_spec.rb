require 'spec_helper'

describe PatientsController do

  login_as(:mike_user)

  let(:valid_session) { {} }
  let(:patient)       { create(:taro) }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:patients]).to eq([patient]) }
  end

  describe "GET show" do
    before { get :show, { id: patient.id }, valid_session }
    it { expect(assigns[:patient]).to eq(patient) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:patient]).to be_a_new(Patient) }
  end

  describe "GET edit" do
    before { get :edit, { id: patient.id }, valid_session }
    it { expect(assigns[:patient]).to eq(patient) }
  end

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) { attributes_for(:jiro) }

      before { post :create, { patient: valid_attributes }, valid_session }

      it { expect(assigns[:patient]).to be_a(Patient) }
      it { expect(assigns[:patient]).to be_persisted }
      it { expect(response).to redirect_to(Patient.last) }
    end

    describe "with invalid params" do
      before do
        Patient.any_instance.stub(:save).and_return(false)
        post :create, {:patient => { "name" => "invalid value" }}, valid_session
      end

      it { expect(assigns[:patient]).to be_a_new(Patient) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: patient.id, patient: { "name" => "MyString" } }, valid_session }

      it { expect(assigns[:patient]).to eq(patient) }
      it { expect(response).to redirect_to(patient) }
    end

    describe "with invalid params" do
      before do
        Patient.any_instance.stub(:save).and_return(false)
        put :update, { id: patient.id, patient: { "name" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:patient]).to eq(patient) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: patient.id }, valid_session }

    it { expect(Patient.count).to eq(0) }
    it { expect(response).to redirect_to(patients_url) }
  end

end
