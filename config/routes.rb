Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  as :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :ideas

  get '/miners/:id', to: 'profiles#show', as: :user_profile
  get '/search-miners', to: 'profiles#search', as: :user_search

  get '/ideas/:id/submit-rating/:rating', to: 'ideas#submit_rating', as: :submit_rating
end
