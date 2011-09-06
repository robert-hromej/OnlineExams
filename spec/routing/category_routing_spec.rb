require "spec_helper"

describe CategoryController do

  describe "routing" do

    it "routes to #index" do
      get(categories_path).should route_to("category#index")
      get("/categories").should route_to("category#index")
    end

    it "routes to #new" do
      get(new_category_path).should route_to("category#new")
      get("/categories/new").should route_to("category#new")
    end

    it "routes to #show" do
      get(category_path(1)).should route_to("category#show", :id => "1")
      get("/categories/1").should route_to("category#show", :id => "1")
    end

    it "routes to #create" do
      post(categories_path).should route_to("category#create")
      post("/categories").should route_to("category#create")
    end

    it "routes to #edit" do
      get(edit_category_path(1)).should route_to("category#edit", :id => "1")
      get("/categories/1/edit").should route_to("category#edit", :id => "1")
    end

    it "routes to #update" do
      put(category_path(1)).should route_to("category#update", :id => "1")
      put("/categories/1").should route_to("category#update", :id => "1")
    end

    it "routes to #destroy" do
      delete(category_path(1)).should route_to("category#destroy", :id => "1")
      delete("/categories/1").should route_to("category#destroy", :id => "1")
    end
  end
end