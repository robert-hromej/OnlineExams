require "spec_helper"

describe AnswerController do
  describe "routing" do

    it "routes to #new" do
      get(new_question_answer_path("1")).should route_to("answer#new", :question_id => "1")
      get("/questions/1/answers/new").should route_to("answer#new", :question_id => "1")
    end

    it "routes to #create" do
      post(question_answers_path(1)).should route_to("answer#create", :question_id => "1")
      post("/questions/1/answers").should route_to("answer#create", :question_id => "1")
    end

    it "routes to #show" do
      get(answer_path(2)).should route_to("answer#show", :id => "2")
      get("/answers/2").should route_to("answer#show", :id => "2")
    end

    it "routes to #edit" do
      get(edit_answer_path(2)).should route_to("answer#edit", :id => "2")
      get("/answers/2/edit").should route_to("answer#edit", :id => "2")
    end

    it "routes to #update" do
      put(answer_path(2)).should route_to("answer#update", :id => "2")
      put("/answers/2").should route_to("answer#update", :id => "2")
    end

    it "routes to #destroy" do
      delete(answer_path(2)).should route_to("answer#destroy", :id => "2")
      delete("/answers/2").should route_to("answer#destroy",:id => "2")
    end
  end
end