OnlineExams::Application.routes.draw do

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/help", :to => "home#help"

  #match "sign_in", :to => "user#sign_in", :as => "sign_in"
  #match "sign_out", :to => "user#sign_out", :as => "sign_out"
  #match "sign_up", :to => "user#sign_up", :as => "sign_up"

  root :to => "home#index"

  devise_for :user
  resources :user, :only => :show
  resources :admin, :only => :index

  resources :exam_categories do
    get :list, :on => :collection
    resources :exam_types
  end



  #match "/administration", :to => "admin#index"

end
