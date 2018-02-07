Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
