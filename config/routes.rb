CrazyProjects::Application.routes.draw do

  root to: "rooms#new"

  resources :rooms do
    resources :messages
  end

end
