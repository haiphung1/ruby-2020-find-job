Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    
    namespace :admin do 
      root to: "admins#index"
    end
  end
end
