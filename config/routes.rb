Rails.application.routes.draw do

  devise_for :users

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :users, only: [:index, :show]

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
