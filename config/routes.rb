Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :user do
      member do
        resources :profile, only: %i(new create)
      end
    end

    namespace :admin do 
      root to: "admins#index"

      resources :posts, except: %i(show)
      resources :users, only: %i(show)
      resources :profiles, only: %i(show)
      resources :user_applies, only: %i(index update)
      resources :companies, only: %i(index edit update)
    end
  end
end
