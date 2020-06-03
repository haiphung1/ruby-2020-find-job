Rails.application.routes.draw do
  namespace :admin do
    root to: "admins#index"
  end
end
