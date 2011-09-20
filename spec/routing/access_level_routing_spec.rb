require "spec_helper"

describe AccessLevelsController do
  describe "routing" do

    it "routes to #create" do
      post("/access_levels").should route_to("access_levels#create")
      post(access_levels_path).should route_to("access_levels#create")
    end

    it "routes to #destroy" do
      delete("/access_levels/1").should route_to("access_levels#destroy", :id => "1")
      delete(access_level_path(1)).should route_to("access_levels#destroy", :id => "1")
    end
  end
end