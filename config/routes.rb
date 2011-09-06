OnlineExams::Application.routes.draw do

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/help", :to => "home#help"

  root :to => "home#index"

  devise_for :user
  resources :user, :only => :show
  resources :admin, :only => :index

  resources :topics, :controller => "topic", :only => [] do
    resources :question
  end

  resources :categories, :controller => "category" do
    #get :list, :on => :collection
    resources :topic, :only => [:new, :show, :edit, :create, :update, :destroy]
  end


  #match "/administration", :to => "admin#index"

end
