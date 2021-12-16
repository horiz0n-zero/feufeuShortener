Rails.application.routes.draw do

  resources :homepage, only: [:index, :create], path: "/"
  get '/:id', to: 'homepage#show'

  get '/.admin', to: 'admin#index'
  delete '/.admin/:id', to: 'admin#destroy'

end
