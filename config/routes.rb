Rails.application.routes.draw do
  devise_for :users

  resources :breeds do
    resources :feed_backs, except:[:index,:show]
  end
  root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
