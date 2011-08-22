require 'spec_helper'

describe AccountsController do
  render_views

  describe "POST 'create'" do
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
