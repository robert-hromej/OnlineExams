require "spec_helper"

describe CategoriesController do

  describe "routing" do

    it "routes to #index" do
      get(categories_path).should route_to("categories#index")
      get("/categories").should route_to("categories#index")
    end

    it "routes to #new" do
      get(new_category_path).should route_to("categories#new")
      get("/categories/new").should route_to("categories#new")
    end

    it "routes to #show" do
      get(category_path(1)).should route_to("categories#show", :id => "1")
      get("/categories/1").should route_to("categories#show", :id => "1")
    end

    it "routes to #create" do
      post(categories_path).should route_to("categories#create")
      post("/categories").should route_to("categories#create")
    end

    it "routes to #edit" do
      get(edit_category_path(1)).should route_to("categories#edit", :id => "1")
      get("/categories/1/edit").should route_to("categories#edit", :id => "1")
    end

    it "routes to #update" do
      put(category_path(1)).should route_to("categories#update", :id => "1")
      put("/categories/1").should route_to("categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete(category_path(1)).should route_to("categories#destroy", :id => "1")
      delete("/categories/1").should route_to("categories#destroy", :id => "1")
    end
  end
end