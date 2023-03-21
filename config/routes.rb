Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #TODOS
  get '/', to: "todos#get_todos"
  post '/create', to: "todos#create"
  put '/update/:id', to: "todos#update"
  delete '/delete/:id', to: "todos#destroy"

  #USERS
  get '/:id', to: "users#show"
  post '/login', to: "users#login"
  delete '/delete/:id', to: "users#destroy"

end
