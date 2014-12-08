Quadro::Engine.routes.draw do
  devise_for :users, class_name: 'Quadro::User', module: :devise, controllers: { unlocks: 'quadro/users/unlocks', passwords: 'quadro/users/passwords', sessions: 'quadro/users/sessions' }

  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :pages, path: '/' do
    resources :widgets, only: [:create, :update, :delete]
    resources :assets, only: [:create, :update, :delete]
  end

  root :to => 'pages#index'
end
