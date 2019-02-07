Rails.application.routes.draw do
  # get 'gossips/:id', to: 'gossips#show_gossip', as: 'gossip'

  # get 'author/:id', to: 'gossips#gossip_author', as: 'author'

  get 'welcome/:user_entry', to: 'welcome#show_welcome', as: 'welcome'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'

  root 'static_pages#home'

  resources :gossips do
  resources :comments
  end
  resources :authors
  resources :cities
  resources :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
