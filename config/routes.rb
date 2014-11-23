Quadro::Engine.routes.draw do
  get "welcome/index"

  resources :widgets, except: [:new, :edit]

  root :to => "welcome#index"
end
