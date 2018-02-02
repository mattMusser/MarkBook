Rails.application.routes.draw do

  devise_for :users

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
  end

  resources :users, only: [:index, :show]
  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
