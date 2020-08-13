Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  resources :posts do
    collection do
      post :confirm
    end
  end
end
