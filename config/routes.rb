OnlineExams::Application.routes.draw do

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/help", :to => "home#help"

  root :to => "home#index"

  devise_for :users
  resources :users, :only => :show

  resources :access_levels, :only => [:create, :destroy]

  resources :admin, :only => :index

  resources :categories, :shallow => true do
    resources :topics, :except => [:index] do
      resources :questions do
        resources :answers
      end
      resources :exams, :only => [] do
        member do
          get :continue
        end
        collection do
          get :start
        end
        resources :exam_questions, :only => [] do
          resources :question_answers, :only => [:create]
        end
      end
    end
  end


  #match "/administration", :to => "admin#index"

end
