require 'spec_helper'

describe PagesController do

  describe "GET 'splash'" do
    it "should be successful" do
      get 'splash'
      response.should be_success
    end
  end

  describe "GET 'learn'" do
    it "should be successful" do
      get 'learn'
      response.should be_success
    end
  end

  describe "GET 'suggestion'" do
    it "should be successful" do
      get 'suggestion'
      response.should be_success
    end
  end

end
