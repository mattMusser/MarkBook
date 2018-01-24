Rails.application.routes.draw do

  get 'users/create'
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
