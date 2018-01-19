Rails.application.routes.draw do

  get 'bookmarks/index'

  get 'bookmarks/show'

  get 'bookmarks/new'

  get 'bookmarks/edit'

  get 'bookmarks/update'

  get 'bookmarks/destroyt'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
