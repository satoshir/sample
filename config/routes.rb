Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    # get から root に帰る時は/を#に変える
    root "users/sessions#new"
    # get '/sign_in', to: 'users/sessions#new'
    get "signup", :to => "users/registrations#new"
    get "signin", :to => "users/sessions#new"
    get "signout", :to => "users/sessions#destroy"
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  namespace :users do
    get 'dash_boards/index'
    resources :articles   
  end
end
