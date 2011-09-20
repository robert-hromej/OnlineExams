require "spec_helper"

describe TopicsController do
  describe "routing" do

    it "routes to #new" do
      get(new_topic_question_path("1")).should route_to("questions#new", :topic_id => "1")
      get("/topics/1/questions/new").should route_to("questions#new", :topic_id => "1")
    end

    it "routes to #create" do
      post(topic_questions_path(1)).should route_to("questions#create", :topic_id => "1")
      post("/topics/1/questions").should route_to("questions#create", :topic_id => "1")
    end

    it "routes to #show" do
      get(question_path(2)).should route_to("questions#show", :id => "2")
      get("/questions/2").should route_to("questions#show", :id => "2")
    end

    it "routes to #edit" do
      get(edit_question_path(2)).should route_to("questions#edit", :id => "2")
      get("/questions/2/edit").should route_to("questions#edit", :id => "2")
    end

    it "routes to #update" do
      put(question_path(2)).should route_to("questions#update", :id => "2")
      put("/questions/2").should route_to("questions#update", :id => "2")
    end

    it "routes to #destroy" do
      delete(question_path(2)).should route_to("questions#destroy", :id => "2")
      delete("/questions/2").should route_to("questions#destroy", :id => "2")
    end
  end
end