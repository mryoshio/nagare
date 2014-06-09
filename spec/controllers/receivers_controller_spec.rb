require 'spec_helper'

describe ReceiversController do

  login_as(:mike_user)

  let(:valid_session) { {} }
  let!(:receiver) { create(:receiver01) }

  describe "GET index" do
    before { get :index, {}, valid_session }
    it { expect(assigns[:receivers]).to eq([receiver]) }
  end

  describe "GET show" do
    before { get :show, { id: receiver.id }, valid_session }
    it { expect(assigns[:receiver]).to eq(receiver) }
  end

  describe "GET new" do
    before { get :new, {}, valid_session }
    it { expect(assigns[:receiver]).to be_a_new(Receiver) }
  end

  describe "GET edit" do
    before { get :edit, { id: receiver.id }, valid_session }
    it { expect(assigns[:receiver]).to eq(receiver) }
  end

  describe "POST create" do
    describe "with valid params" do
      let(:valid_attributes) { attributes_for(:receiver02) }

      before { post :create, { receiver: valid_attributes}, valid_session }

      it { expect(assigns[:receiver]).to be_a(Receiver) }
      it { expect(assigns[:receiver]).to be_persisted }
      it { expect(response).to redirect_to(Receiver.last) }
    end

    describe "with invalid params" do
      before do
        Receiver.any_instance.stub(:save).and_return(false)
        post :create, { receiver: { "name" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:receiver]).to be_a_new(Receiver) }
      it { expect(response).to render_template(:new) }
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { put :update, { id: receiver.id, receiver: { "name" => "MyString" } }, valid_session }

      it { expect(assigns[:receiver]).to eq(receiver) }
      it { expect(response).to redirect_to(receiver) }
    end

    describe "with invalid params" do
      before do
        Receiver.any_instance.stub(:save).and_return(false)
        put :update, { id: receiver.id, receiver: { "name" => "invalid value" } }, valid_session
      end

      it { expect(assigns[:receiver]).to eq(receiver) }
      it { expect(response).to render_template(:edit) }
    end
  end

  describe "DELETE destroy" do
    before { delete :destroy, { id: receiver.id }, valid_session }

    it { expect(Receiver.count).to eq(0) }
    it { expect(response).to redirect_to(receivers_url) }
  end

end
