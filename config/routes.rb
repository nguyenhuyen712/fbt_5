Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, controllers: {registrations: "my_devise/registrations",
    omniauth_callbacks: "callbacks#create"}

  root "static_pages#show", page: "home"

  namespace :admin do
    resources :users
  end

  resource :user, only: :show
  resources :tours, only: :show do
    resources :reviews, only: [:new, :create, :show]do
      resources :comments, only: :create
    end
  end

end
