Caldjs::Application.routes.draw do

  resources :comments do
    member do
      get :read
      get :unread
    end
  end
  resources :photos
  resources :posts do
    member do
      get :publish
    end
  end
  resources :sessions
  resources :users

  root to: 'pages#home'

  # Pages
  match '/about' => 'pages#about', as: :about
  match '/contact' => 'pages#contact', as: :contact

  # Photos
  match '/upload' => 'photos#upload', as: :upload
  match '/upload-photo' => 'photos#upload_photo', as: :upload_photo

  # Posts
  match '/blog' => 'posts#blog', as: :blog

  # Sessions
  match '/sign-in' => 'sessions#new', as: :signin
  match '/sign-out' => 'sessions#destroy', as: :signout
end