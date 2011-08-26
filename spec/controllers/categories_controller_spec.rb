require 'spec_helper'

describe CategoriesController do
  render_views

  before(:each) do
    @user = Factory(:user)

    @admin_user = Factory(:user, :email => Factory.next(:email))
    @admin_user.admin = true
    @admin_user.save

    %w[Ruby Java C++ C# HTML CSS RubyOnRails JavaScript MySQL Ajax JQuery Prototype SCSS ActiveRecord].each do |category|
      Factory(:category, :name => category, :owner => @admin_user)
    end

    @categories = Category.all
    @categories.each do |category|
      max_level = rand(4)+3
      max_level.times do |i|
        Factory(:exam_type, :owner => @admin_user, :category => category, :name => "#{category.name} core(#{i+1} level)")
      end
    end
  end

  describe "I am sign out" do

    before(:each) do
      @categories = Category.all
      redirect_to destroy_user_session_path
    end

    it "should deny access to 'index'" do
      get :index
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'show'" do
      get :show, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'new'" do
      get :new
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'create'" do
      post :create, :category => {}
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'edit'" do
      get :edit, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'update'" do
      post :update, :category => {}, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'destroy'" do
      put :destroy, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "I am sign in" do

    before(:each) do
      sign_in @user
    end

    it "should not deny access to 'index'" do
      get :index
      response.should be_success
      response.should render_template(:index)
    end

    it "should not deny access to 'show'" do
      get :show, :id => @categories.first.id
      response.should be_success
      response.should render_template(:show)
    end

    it "should deny access to 'new'" do
      get :new
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should deny access to 'create'" do
      post :create, :category => {}
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should deny access to 'edit'" do
      get :edit, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should deny access to 'update'" do
      post :update, :category => {}, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should deny access to 'destroy'" do
      put :destroy, :id => @categories.first.id
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should be see category list" do
      get :index
      @categories.each do |category|
        response.should have_selector(".round a.category_link", :content => category.name)
      end
    end

    it "should not be create button" do
      get :index
      response.should_not have_selector("a", :content => I18n.t('button.create_category'))
    end

    it "should be category show page" do
      @categories.each do |category|
        get :show, :id => category.id
        response.should render_template(:show)
        response.should have_selector("label", :content => category.name)
        category.exam_types.each do |exam_type|
          response.should have_selector("a", :content => exam_type.name,
                                        :href => category_exam_type_path(exam_type.category, exam_type))
        end
        response.should_not have_selector("a", :content => I18n.t('button.create_exam_type'))
      end
    end

    describe "I am admin user" do

      before(:each) do
        sign_in @admin_user
        @attr = {:name => "new category"}
      end

      it "should not deny access to 'new'" do
        get :new
        response.should be_success
        response.should render_template(:new)
      end

      it "should not deny access to 'create'" do
        post :create, :category => {}
        response.should be_success
        response.should render_template(:new)
      end

      it "should not deny access to 'edit'" do
        get :edit, :id => @categories.first.id
        response.should be_success
        response.should render_template(:edit)
      end

      it "should not deny access to 'update'" do
        category = @categories.first
        post :update, :category => {}, :id => category.id
        response.should be_success
        flash[:notice].eql? I18n.t('notice.success_update_category', :name => category.name)
        response.should render_template(:show)
      end

      it "should not deny access to 'destroy'" do
        category = @categories.first
        put :destroy, :id => category.id
        response.should be_success
        flash[:notice].should.eql? I18n.t('notice.success_destroy_category', :name => categories.name)
        response.should render_template(:index)
      end

      it "should by create button" do
        get :index
        response.should have_selector('.round>a',
                                      :content => I18n.t('button.create_category'),
                                      :class => "create_button",
                                      :href => new_category_path)
      end

    end
  end


end
