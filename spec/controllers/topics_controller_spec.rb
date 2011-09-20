require 'spec_helper'

describe TopicsController do

  before(:each) do
    @user = Factory(:user)

    @admin_user = Factory(:user, :email => Factory.next(:email))
    @admin_user.admin = true
    @admin_user.save

    @category = Factory(:category, :name => "RubyOnRails", :owner => @admin_user)

    5.times do |i|
      Factory(:topic, :owner => @admin_user, :category => @category, :name => "#{@category.name} core(#{i+1} level)")
    end
  end

  describe "I am logout user" do

    it "should deny access to 'show'" do
      topic = @category.topics.first
      get :show, :id => topic.id, :category_id => @category.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'new'" do
      get :new, :category_id => @category.id
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end

    it "should deny access to 'create'" do
      post :create, :category_id => @category.id, :category => {}
      flash[:alert].should.eql? I18n.t('alert.need_sign_in')
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "I am login by simple user" do

    before(:each) do
      sign_in @user
    end

    it "should not deny access to 'show'" do
      topic = @category.topics.first
      get :show, :id => topic.id, :category_id => @category.id
      flash[:alert].should be_blank
      response.should render_template(:show)
    end

    it "should deny access to 'new'" do
      get :new, :category_id => @category.id
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    it "should deny access to 'create'" do
      post :create, :category_id => @category.id, :category => {}
      flash[:alert].should.eql? I18n.t('alert.dont_access_level')
      response.should redirect_to(root_path)
    end

    describe "I am admin user" do

      before(:each) do
        sign_in @admin_user
      end

      it "should not deny access to 'new'" do
        get :new, :category_id => @category.id
        flash[:alert].should be_blank
        response.should render_template(:new)
      end

      it "should not deny access to 'create'" do
        get :create, :category_id => @category.id, :category => {}
        flash[:alert].should be_blank
        response.should be_success
      end

    end
  end
end
