OnlineExams::Application.routes.draw do

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/help", :to => "home#help"

  root :to => "home#index"

  devise_for :user
  resources :user, :only => :show

  resources :access_levels, :controller => "access_level", :only => [:create, :destroy]

  resources :admin, :only => :index

  resources :categories, :controller => "category", :shallow => true do
    resources :topics, :controller => 'topic', :except => [:index] do
      resources :questions, :controller => "question" do
        resources :answers, :controller => "answer"
      end
      resources :exams, :controller => "exam", :only => [] do
        member do
          get :continue
        end
        collection do
          get :start
        end
        resources :exam_questions, :controller => "exam_question", :only => [] do
          resources :question_answers, :controller => "question_answer", :only => [:create]
        end
      end
    end
  end


  #match "/administration", :to => "admin#index"

end
