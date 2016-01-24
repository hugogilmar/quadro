Quadro::Engine.routes.draw do
  devise_for :users, class_name: 'Quadro::User', module: :devise

  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :pages, path: '/' do
    get 'page/:page', action: :index, on: :collection
    resources :widgets, only: [:update] do
      resources :assets, only: [:create, :edit, :update, :destroy]
    end
    resources :assets, only: [:create, :edit, :update, :destroy]
  end

  root :to => 'pages#index'
end
