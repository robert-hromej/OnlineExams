require "spec_helper"

describe UserController do
  describe "routing" do

    describe "devise/session" do

      it "routes to #new" do
        get(new_user_session_path).should route_to("devise/sessions#new")
        get("/user/sign_in").should route_to("devise/sessions#new")
      end

      it "routes to #create" do
        post(user_session_path).should route_to("devise/sessions#create")
        post("/user/sign_in").should route_to("devise/sessions#create")
      end

      it "routes to #destroy" do
        get(destroy_user_session_path).should route_to("devise/sessions#destroy")
        get("/user/sign_out").should route_to("devise/sessions#destroy")
      end
    end

    describe "device/passwords" do

      it "routes to #create" do
        post(user_password_path).should route_to("devise/passwords#create")
        post("/user/password").should route_to("devise/passwords#create")
      end

      it "routes to #new" do
        get(new_user_password_path).should route_to("devise/passwords#new")
        get("/user/password/new").should route_to("devise/passwords#new")
      end

      it "routes to #edit" do
        get(edit_user_password_path).should route_to("devise/passwords#edit")
        get("/user/password/edit").should route_to("devise/passwords#edit")
      end

      it "routes to #update" do
        put(user_password_path).should route_to("devise/passwords#update")
        put("/user/password").should route_to("devise/passwords#update")
      end
    end

    describe "devise/registrations" do

      it "routes to #create" do
        post(user_registration_path).should route_to("devise/registrations#create")
        post("/user").should route_to("devise/registrations#create")
      end

      it "routes to #new" do
        get(new_user_registration_path).should route_to("devise/registrations#new")
        get("/user/sign_up").should route_to("devise/registrations#new")
      end

      it "routes to #edit" do
        get(edit_user_registration_path).should route_to("devise/registrations#edit")
        get("/user/edit").should route_to("devise/registrations#edit")
      end

      it "routes to #update" do
        put(user_registration_path).should route_to("devise/registrations#update")
        put("/user").should route_to("devise/registrations#update")
      end

      it "routes to #destroy" do
        delete(user_registration_path).should route_to("devise/registrations#destroy")
        delete("/user").should route_to("devise/registrations#destroy")
      end

      it "routes to #cancel" do
        get(cancel_user_registration_path).should route_to("devise/registrations#cancel")
        get("/user/cancel").should route_to("devise/registrations#cancel")
      end
    end

    it "routes to #show" do
      get(user_path(1)).should route_to("user#show", :id => "1")
      get("/user/1").should route_to("user#show", :id => "1")
    end
  end
end