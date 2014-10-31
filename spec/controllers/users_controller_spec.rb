require 'rails_helper'

RSpec.describe UsersController, :type => :controller do


    it "#new" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:user)).to be_new_record
    end

    # it "#index" do
    #   get :index
    #   expect(response).to be_success
    #   expect(response).to have_http_status(200)
    # end


    it '#create success' do
      params = {
        user: {
          username: "testname",
          password: "testpassword",
          password_confirmation: "testpassword",
        },
      }
      post :create, params
      expect(assigns(:user)).to_not be_new_record
      expect(session[:user_id]).to be(assigns(:user).id)
      expect(flash[:success]).to_not be_blank
      expect(response).to be_redirect
      expect(response).to have_http_status(302)
    end

    it '#create failure' do
      params = {
        user: {
          username: "testname",
          password: "testpassword",
          password_confirmation: "wrong",
        },
      }
      post :create, params
      expect(assigns(:user)).to be_invalid
      expect(response).to render_template('new')
      expect(response).to have_http_status(422)

    end

end
