Quadro::Engine.routes.draw do
  match 'sitemap.xml' => 'sitemaps#sitemap'

  resources :pages, path: "/" do
    resources :widgets, only: [:create, :update, :delete]
    resources :assets, only: [:create, :update, :delete]
  end

  root :to => "pages#index"
end
Rails.application.routes.prepend do
  match 'sitemap.xml' => 'sitemaps#sitemap'
end
