Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items do
    resources :oredr, only: :create do
      resources :oredr, only:[ :index] 
    end
      
  end
end

