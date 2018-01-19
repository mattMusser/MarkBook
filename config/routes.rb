Rails.application.routes.draw do

  devise_for :users

  get 'faq' => 'welcome#faq'

  root 'welcome#index'

end
