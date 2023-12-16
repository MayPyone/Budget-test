Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'splash#index', as: :unauthenticated_root
  end
   
  resources :splash
  resources :groups do
    resources :entities
  end
end
