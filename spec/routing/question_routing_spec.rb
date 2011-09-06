require "spec_helper"

describe TopicController do
  describe "routing" do

    it "routes to #new" do
      get(new_topic_question_path("1")).should route_to("question#new", :topic_id => "1")
      get("/topics/1/question/new").should route_to("question#new", :topic_id => "1")
    end

    it "routes to #create" do
      post(topic_question_index_path(1)).should route_to("question#create", :topic_id => "1")
      post("/topics/1/question").should route_to("question#create", :topic_id => "1")
    end

    it "routes to #show" do
      get(topic_question_path(1, 2)).should route_to("question#show", :topic_id => "1", :id => "2")
      get("topics/1/question/2").should route_to("question#show", :topic_id => "1", :id => "2")
    end

    it "routes to #edit" do
      get(edit_topic_question_path(1, 2)).should route_to("question#edit", :topic_id => "1", :id => "2")
      get("/topics/1/question/2/edit").should route_to("question#edit", :topic_id => "1", :id => "2")
    end

    it "routes to #update" do
      put(topic_question_path(1, 2)).should route_to("question#update", :topic_id => "1", :id => "2")
      put("/topics/1/question/2").should route_to("question#update", :topic_id => "1", :id => "2")
    end

    it "routes to #destroy" do
      delete(topic_question_path(1, 2)).should route_to("question#destroy", :topic_id => "1", :id => "2")
      delete("/topics/1/question/2").should route_to("question#destroy", :topic_id => "1", :id => "2")
    end
  end
end