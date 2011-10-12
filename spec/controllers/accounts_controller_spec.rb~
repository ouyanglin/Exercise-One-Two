require 'spec_helper'

describe AccountsController do
  render_views

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @screen_name = "I heart money"
      end

      it "should not create a user" do
        lambda do
          post :create, :account => @attr
        end.should_not change(Account, :count)
      end
    end
  end

  describe "POST 'update'" do
  end

  describe "GET 'show'" do
    it "should be successful" do
      get :show, :id => 1
      response.should be_success
    end
  end

end
