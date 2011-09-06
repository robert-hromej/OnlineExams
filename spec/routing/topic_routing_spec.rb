require "spec_helper"

describe TopicController do
  describe "routing" do

    it "routes to #new" do
      get(new_category_topic_path("1")).should route_to("topic#new", :category_id => "1")
      get("/categories/1/topic/new").should route_to("topic#new", :category_id => "1")
    end

    it "routes to #create" do
      post(category_topic_index_path(1)).should route_to("topic#create", :category_id => "1")
      post("/categories/1/topic").should route_to("topic#create", :category_id => "1")
    end

    it "routes to #show" do
      get(category_topic_path(1, 2)).should route_to("topic#show", :category_id => "1", :id => "2")
      get("/categories/1/topic/2").should route_to("topic#show", :category_id => "1", :id => "2")
    end

    it "routes to #edit" do
      get(edit_category_topic_path(1, 2)).should route_to("topic#edit", :category_id => "1", :id => "2")
      get("/categories/1/topic/2/edit").should route_to("topic#edit", :category_id => "1", :id => "2")
    end

    it "routes to #update" do
      put(category_topic_path(1, 2)).should route_to("topic#update", :category_id => "1", :id => "2")
      put("/categories/1/topic/2").should route_to("topic#update", :category_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      delete(category_topic_path(1, 2)).should route_to("topic#destroy", :category_id => "1", :id => "2")
      delete("/categories/1/topic/2").should route_to("topic#destroy", :category_id => "1", :id => "2")
    end
  end
end