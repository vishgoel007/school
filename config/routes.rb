Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }

  root to: 'posts#index'
  resources :posts
  get 'users/profile'
  patch 'users/update' => 'users#update', as: 'user'
  get 'toggle_grade/:grade' => 'grades#toggle_grade', as: 'toggle_grade'
  get 'toggle_bookmark/:post' => 'bookmarks#toggle_bookmark', as: 'toggle_bookmark'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
