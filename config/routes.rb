Rails.application.routes.draw do
  devise_for :user_accounts

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "/", to: redirect("/posts")
  resources :posts
end
