require 'spec_helper'

describe AdminController do
  render_views

  describe "I am sign out" do

    it "should be redirect to sign in page" do
      redirect_to destroy_user_session_path
      get :index
      flash[:alert].should == I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "I am sign in by admin user" do

    it "should be redirect to categories page" do
      @admin_user = Factory(:user)
      @admin_user.admin = true
      @admin_user.save
      sign_in @admin_user
      get :index
      response.should redirect_to(categories_path)
    end
  end

  describe "I am sign in by simple user" do

    it "should be redirect to home page" do
      @user = Factory(:user)
      sign_in @user
      get :index
      flash[:alert].should == I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end
  end

end
