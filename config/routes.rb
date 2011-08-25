OnlineExams::Application.routes.draw do

  #match "sign_in", :to => "user#sign_in", :as => "sign_in"
  #match "sign_out", :to => "user#sign_out", :as => "sign_out"
  #match "sign_up", :to => "user#sign_up", :as => "sign_up"

  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show

end
