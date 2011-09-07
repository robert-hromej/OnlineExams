require "spec_helper"

describe AccessLevelController do
  describe "routing" do

    it "routes to #create" do
      post("/access_levels").should route_to("access_level#create")
      post(access_levels_path).should route_to("access_level#create")
    end

    it "routes to #destroy" do
      delete("/access_levels/1").should route_to("access_level#destroy", :id => "1")
      delete(access_level_path(1)).should route_to("access_level#destroy", :id => "1")
    end
  end
end