require 'spec_helper'

#TODO: rewrite this file

describe ReceiversController do
  login_as(:mike_user)

  # This should return the minimal set of attributes required to create a valid
  # Receiver. As you add validations to Receiver, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReceiversController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all receivers as @receivers" do
      receiver = Receiver.create! valid_attributes
      get :index, {}, valid_session
      assigns(:receivers).should eq([receiver])
    end
  end

  describe "GET show" do
    it "assigns the requested receiver as @receiver" do
      receiver = Receiver.create! valid_attributes
      get :show, {:id => receiver.to_param}, valid_session
      assigns(:receiver).should eq(receiver)
    end
  end

  describe "GET new" do
    it "assigns a new receiver as @receiver" do
      get :new, {}, valid_session
      assigns(:receiver).should be_a_new(Receiver)
    end
  end

  describe "GET edit" do
    it "assigns the requested receiver as @receiver" do
      receiver = Receiver.create! valid_attributes
      get :edit, {:id => receiver.to_param}, valid_session
      assigns(:receiver).should eq(receiver)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Receiver" do
        expect {
          post :create, {:receiver => valid_attributes}, valid_session
        }.to change(Receiver, :count).by(1)
      end

      it "assigns a newly created receiver as @receiver" do
        post :create, {:receiver => valid_attributes}, valid_session
        assigns(:receiver).should be_a(Receiver)
        assigns(:receiver).should be_persisted
      end

      it "redirects to the created receiver" do
        post :create, {:receiver => valid_attributes}, valid_session
        response.should redirect_to(Receiver.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved receiver as @receiver" do
        # Trigger the behavior that occurs when invalid params are submitted
        Receiver.any_instance.stub(:save).and_return(false)
        post :create, {:receiver => { "name" => "invalid value" }}, valid_session
        assigns(:receiver).should be_a_new(Receiver)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Receiver.any_instance.stub(:save).and_return(false)
        post :create, {:receiver => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested receiver" do
        receiver = Receiver.create! valid_attributes
        # Assuming there are no other receivers in the database, this
        # specifies that the Receiver created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Receiver.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => receiver.to_param, :receiver => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested receiver as @receiver" do
        receiver = Receiver.create! valid_attributes
        put :update, {:id => receiver.to_param, :receiver => valid_attributes}, valid_session
        assigns(:receiver).should eq(receiver)
      end

      it "redirects to the receiver" do
        receiver = Receiver.create! valid_attributes
        put :update, {:id => receiver.to_param, :receiver => valid_attributes}, valid_session
        response.should redirect_to(receiver)
      end
    end

    describe "with invalid params" do
      it "assigns the receiver as @receiver" do
        receiver = Receiver.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Receiver.any_instance.stub(:save).and_return(false)
        put :update, {:id => receiver.to_param, :receiver => { "name" => "invalid value" }}, valid_session
        assigns(:receiver).should eq(receiver)
      end

      it "re-renders the 'edit' template" do
        receiver = Receiver.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Receiver.any_instance.stub(:save).and_return(false)
        put :update, {:id => receiver.to_param, :receiver => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested receiver" do
      receiver = Receiver.create! valid_attributes
      expect {
        delete :destroy, {:id => receiver.to_param}, valid_session
      }.to change(Receiver, :count).by(-1)
    end

    it "redirects to the receivers list" do
      receiver = Receiver.create! valid_attributes
      delete :destroy, {:id => receiver.to_param}, valid_session
      response.should redirect_to(receivers_url)
    end
  end

end
