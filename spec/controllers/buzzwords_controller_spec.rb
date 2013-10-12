require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BuzzwordsController do

  # This should return the minimal set of attributes required to create a valid
  # Buzzword. As you add validations to Buzzword, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "word" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BuzzwordsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all buzzwords as @buzzwords" do
      buzzword = Buzzword.create! valid_attributes
      get :index, {}, valid_session
      assigns(:buzzwords).should eq([buzzword])
    end
  end

  describe "GET show" do
    it "assigns the requested buzzword as @buzzword" do
      buzzword = Buzzword.create! valid_attributes
      get :show, {:id => buzzword.to_param}, valid_session
      assigns(:buzzword).should eq(buzzword)
    end
  end

  describe "GET new" do
    it "assigns a new buzzword as @buzzword" do
      get :new, {}, valid_session
      assigns(:buzzword).should be_a_new(Buzzword)
    end
  end

  describe "GET edit" do
    it "assigns the requested buzzword as @buzzword" do
      buzzword = Buzzword.create! valid_attributes
      get :edit, {:id => buzzword.to_param}, valid_session
      assigns(:buzzword).should eq(buzzword)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Buzzword" do
        expect {
          post :create, {:buzzword => valid_attributes}, valid_session
        }.to change(Buzzword, :count).by(1)
      end

      it "assigns a newly created buzzword as @buzzword" do
        post :create, {:buzzword => valid_attributes}, valid_session
        assigns(:buzzword).should be_a(Buzzword)
        assigns(:buzzword).should be_persisted
      end

      it "redirects to the created buzzword" do
        post :create, {:buzzword => valid_attributes}, valid_session
        response.should redirect_to(Buzzword.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved buzzword as @buzzword" do
        # Trigger the behavior that occurs when invalid params are submitted
        Buzzword.any_instance.stub(:save).and_return(false)
        post :create, {:buzzword => { "word" => "invalid value" }}, valid_session
        assigns(:buzzword).should be_a_new(Buzzword)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Buzzword.any_instance.stub(:save).and_return(false)
        post :create, {:buzzword => { "word" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested buzzword" do
        buzzword = Buzzword.create! valid_attributes
        # Assuming there are no other buzzwords in the database, this
        # specifies that the Buzzword created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Buzzword.any_instance.should_receive(:update).with({ "word" => "MyString" })
        put :update, {:id => buzzword.to_param, :buzzword => { "word" => "MyString" }}, valid_session
      end

      it "assigns the requested buzzword as @buzzword" do
        buzzword = Buzzword.create! valid_attributes
        put :update, {:id => buzzword.to_param, :buzzword => valid_attributes}, valid_session
        assigns(:buzzword).should eq(buzzword)
      end

      it "redirects to the buzzword" do
        buzzword = Buzzword.create! valid_attributes
        put :update, {:id => buzzword.to_param, :buzzword => valid_attributes}, valid_session
        response.should redirect_to(buzzword)
      end
    end

    describe "with invalid params" do
      it "assigns the buzzword as @buzzword" do
        buzzword = Buzzword.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Buzzword.any_instance.stub(:save).and_return(false)
        put :update, {:id => buzzword.to_param, :buzzword => { "word" => "invalid value" }}, valid_session
        assigns(:buzzword).should eq(buzzword)
      end

      it "re-renders the 'edit' template" do
        buzzword = Buzzword.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Buzzword.any_instance.stub(:save).and_return(false)
        put :update, {:id => buzzword.to_param, :buzzword => { "word" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested buzzword" do
      buzzword = Buzzword.create! valid_attributes
      expect {
        delete :destroy, {:id => buzzword.to_param}, valid_session
      }.to change(Buzzword, :count).by(-1)
    end

    it "redirects to the buzzwords list" do
      buzzword = Buzzword.create! valid_attributes
      delete :destroy, {:id => buzzword.to_param}, valid_session
      response.should redirect_to(buzzwords_url)
    end
  end

end
