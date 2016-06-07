Quadro::Engine.routes.draw do
  default_url_options host: Quadro.vars[:host]

  devise_for :users, class_name: 'Quadro::User', module: :devise

  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :pages, path: '/' do
    member do
      post :form
    end
    get 'page/:page', action: :index, on: :collection
    resources :widgets, only: [:edit, :update] do
      resources :assets, only: [:create, :edit, :update, :destroy]
    end
    resources :assets, only: [:create, :edit, :update, :destroy]
  end

  root :to => 'pages#index'
end
