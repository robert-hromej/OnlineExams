require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should redirect_to(categories_path)
      #response.should be_success
    end
  end

end
