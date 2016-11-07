Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :personalities, :list_items, :activities
  resources :activities do
    resource :votes
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/share/:id' => 'users#share'

  root 'welcome#index'
end
