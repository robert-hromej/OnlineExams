OnlineExams::Application.routes.draw do

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/help", :to => "home#help"

  root :to => "home#index"

  devise_for :user
  resources :user, :only => :show
  resources :admin, :only => :index

  resources :categories do
    #get :list, :on => :collection
    resources :exam_types
  end



  #match "/administration", :to => "admin#index"

end
