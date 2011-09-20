require "spec_helper"

describe ExamsController do
  describe "routing" do

    it "routes to #start" do
      get(start_topic_exams_path("1")).should route_to("exams#start", :topic_id => "1")
      get("/topics/1/exams/start").should route_to("exams#start", :topic_id => "1")
    end

    it "routes to #continue" do
      get(continue_exam_path("1")).should route_to("exams#continue", :id => "1")
      get("/exams/1/continue").should route_to("exams#continue", :id => "1")
    end
  end
end