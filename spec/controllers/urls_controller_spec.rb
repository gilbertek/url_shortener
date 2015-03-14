require 'rails_helper'
require 'byebug'

describe UrlsController, type: :controller do

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UrlsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    context "with form" do
      it "display the form to populate url" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Url" do
        post :create, url: FactoryGirl.attributes_for(:url)
        expect(response.status).to eq 302
      end

      it "assigns a newly created url as url" do
        post :create, url: FactoryGirl.attributes_for(:url)
        expect(assigns(:url)).to be_a(Url)
        expect(assigns(:url)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved url as url" do
        post :create, url: FactoryGirl.attributes_for(:url)
        expect(response.status).to eq 302
      end
    end
  end
end
