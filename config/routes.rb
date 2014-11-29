Quadro::Engine.routes.draw do
  resources :pages, path: "/" do
    resources :widgets, only: [:create, :update, :delete]
  end

  root :to => "pages#index"
end
