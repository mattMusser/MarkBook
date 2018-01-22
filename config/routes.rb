Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks

  devise_for :users

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
