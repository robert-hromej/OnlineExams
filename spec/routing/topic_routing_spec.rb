require "spec_helper"

describe TopicsController do
  describe "routing" do

    it "routes to #new" do
      get(new_category_topic_path("1")).should route_to("topics#new", :category_id => "1")
      get("/categories/1/topics/new").should route_to("topics#new", :category_id => "1")
    end

    it "routes to #create" do
      post(category_topics_path(1)).should route_to("topics#create", :category_id => "1")
      post("/categories/1/topics").should route_to("topics#create", :category_id => "1")
    end

    it "routes to #show" do
      get(topic_path(2)).should route_to("topics#show", :id => "2")
      get("/topics/2").should route_to("topics#show", :id => "2")
    end

    it "routes to #edit" do
      get(edit_topic_path(2)).should route_to("topics#edit", :id => "2")
      get("/topics/2/edit").should route_to("topics#edit", :id => "2")
    end

    it "routes to #update" do
      put(topic_path(2)).should route_to("topics#update", :id => "2")
      put("/topics/2").should route_to("topics#update", :id => "2")
    end

    it "routes to #destroy" do
      delete(topic_path(2)).should route_to("topics#destroy", :id => "2")
      delete("/topics/2").should route_to("topics#destroy", :id => "2")
    end
  end
end