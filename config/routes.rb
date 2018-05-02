Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }

  root to: 'posts#index'
  resources :posts
  get 'users/profile'
  patch 'users/update' => 'users#update', as: 'user'
  post 'add_grade/:grade' => 'grades#add_grade', as: 'add_grade'
  delete 'remove_grade/:grade' => 'grades#remove_grade', as: 'remove_grade'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
