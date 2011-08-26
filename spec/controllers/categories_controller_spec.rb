require 'spec_helper'

describe CategoriesController do
  render_views

  describe "I am sign out" do

    it "should be redirect to home page" do
      redirect_to destroy_user_session_path
      get :index
      flash[:alert].should == I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "I am sign in" do

    before(:each) do
      @user = Factory(:user)
      sign_in @user
    end

    it "should be success open page" do
      get :index
      response.should render_template(:index)
    end

    it "should be see category list" do
      get :index
      Category.all.each do |category|
        response.should have_selector("div.category_item", :content => category.name)
      end
    end

    it "should not be create button" do
      get :index
      response.should_not have_selector("a", :content => I18n.t('button.create_category'))
    end

    describe "I am admin user" do

      before(:each) do
        @user.admin = true
        @user.save
      end

      it "should by create button" do
        get :index
        p response.body
        response.should have_selector('a', :content => I18n.t('button.create_category').downcase, :href => new_category_path)
      end
    end
  end


end
