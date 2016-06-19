Quadro::Engine.routes.draw do
  default_url_options host: Quadro.config.host

  devise_for :users, class_name: 'Quadro::User', module: :devise, path: 'auth'

  resource :user, only: [:edit, :update]

  match 'atom.xml', to: 'feeds#atom', as: 'atom', format: 'xml'
  match 'rss.xml', to: 'feeds#rss', as: 'rss', format: 'xml'
  match 'sitemap.xml', to: 'sitemaps#sitemap', as: 'sitemap', format: 'xml'
  match 'robots.txt', to: 'robots#index', as: 'robots', format: 'txt'

  resources :pages, path: '/' do
    member do
      post :form
      get :publish
      get :unpublish
    end
    get 'page/:page', action: :index, on: :collection
    resources :widgets, only: [:edit, :update] do
      resources :assets, only: [:create, :edit, :update, :destroy]
    end
    resources :assets, only: [:create, :edit, :update, :destroy]
  end

  root :to => 'pages#index'
end
