require 'spec_helper'

describe CategoryController do
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
        Factory(:topic, :owner => @admin_user, :category => category, :name => "#{category.name} core(#{i+1} level)")
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
      flash[:alert].should be_blank
      response.should_not be_redirect
    end

    it "should not deny access to 'show'" do
      category = @categories.first
      get :show, :id => category.id
      flash[:alert].should be_blank
      response.should_not be_redirect
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

    it "should not be edit link" do
      category = @categories.first
      get :show, :id => category.id
      response.should_not have_link("a",
                                    :content => I18n.t('button.edit'),
                                    :href => edit_category_path(category.id))
    end

    it "should not be create button" do
      get :index
      response.should_not have_selector('.round>a',
                                        :content => I18n.t('button.create_category'),
                                        :class => "create_button",
                                        :href => new_category_path)
    end

    it "should be category show page" do
      category = @categories.first
      get :show, :id => category.id
      response.should render_template(:show)
      # TODO move next tests to TopicController spec
      ##response.should have_label("label", :content => category.name) # todo dont work
      #category.topics.each do |topic|
      #  response.should have_selector("a", :content => topic.name,
      #                                :href => category_topic_path(topic.category, topic))
      #end
    end

    describe "I am admin user" do

      before(:each) do
        sign_in @admin_user
        @attr = {:name => "new category"}
      end

      it "should not deny access to 'new'" do
        get :new
        flash[:alert].should be_blank
        response.should_not be_redirect
      end

      it "should not deny access to 'create'" do
        post :create, :category => {}
        flash[:alert].should be_blank
        response.should_not be_redirect
      end

      it "should not deny access to 'edit'" do
        get :edit, :id => @categories.first.id
        flash[:alert].should be_blank
        response.should_not be_redirect
      end

      it "should not deny access to 'update'" do
        category = @categories.first
        post :update, :category => {}, :id => category.id
        flash[:notice].eql? I18n.t('notice.success_update_category', :name => category.name)
        flash[:alert].should be_blank
        response.should_not be_redirect
      end

      it "should not deny access to 'destroy'" do
        lambda do
          category = @categories.first
          put :destroy, :id => category.id
          flash[:notice].should.eql? I18n.t('notice.success_destroy_category', :name => category.name)
          flash[:alert].should be_blank
          response.should redirect_to(categories_path)
        end.should change(Category, :count).by(-1)
      end

      it "should be edit link" do
        category = @categories.first
        get :show, :id => category.id
        response.should have_selector('a',
                                      :content => I18n.t('button.edit'),
                                      :href => edit_category_path(category.id))
      end

      it "should by create button" do
        get :index
        response.should have_selector('.round>a',
                                      :content => I18n.t('button.create_category'),
                                      :class => "create_button",
                                      :href => new_category_path)
      end

      describe "create new category" do

        before(:each) do
          @attr = {:name => "new category name #{rand(100)}"}
        end

        it "success" do
          lambda do
            post :create, :category => @attr
            flash[:notice].should.eql? I18n.t('notice.success_create_category', :name => @attr[:name])
          end.should change(Category, :count).by(1)
        end

        it "fail" do
          lambda do
            post :create, :category => {}
            assigns[:errors].should_not be_empty
          end.should_not change(Category, :count).by(1)
        end
      end

      describe "edit category" do

        it "success" do
          category = Category.last
          old_name = category.name
          new_name = "new category name"
          post :update, :category => {:name => new_name}, :id => category.id
          flash[:notice].should.eql? I18n.t('notice.success_update_category', :name => new_name)
        end

        it "fail" do
          category = Category.last
          post :update, :category => {:name => nil}, :id => category.id
          assigns[:errors].should_not be_empty
        end
      end

      describe "destroy category" do

        it "success" do
          category = Category.last
          lambda do
            put :destroy, :id => category.id
            flash[:notice].should.eql? I18n.t('notice.success_destroy_category', :name => category.name)
          end.should change(Category, :count).by(-1)
        end

        it "fail" do
          lambda do
            put :destroy, :id => Category.last.id + 1
            flash[:alert].should.eql? I18n.t('alert.dont_destroy_category', :id => Category.last.id + 1)
            response.should redirect_to(categories_path)
          end.should_not change(Category, :count).by(-1)
        end
      end
    end
  end
end
