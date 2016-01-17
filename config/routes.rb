Quadro::Engine.routes.draw do
  devise_for :users, class_name: 'Quadro::User', module: :devise

  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :pages, path: '/' do
    get 'page/:page', action: :index, on: :collection
    resources :widgets, only: [:create, :update, :destroy]
    resources :assets, only: [:create, :update, :destroy]
  end

  root :to => 'pages#index'
end
