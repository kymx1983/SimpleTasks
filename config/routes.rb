Rails.application.routes.draw do
  get 'user/edit'
  get 'user/login'
  get 'user/new'
  get 'user/show'
  get 'comment/new'
  get 'comment/edit'
  get 'task/index'
  get "task/show/:id" => "task#show"
  get "task/destroy/:id" => "task#destroy"
  get "task/edit/:id" => "task#edit"
  get 'task/new'
  post "task/search"
  post "task/create"
  post "task/update"
  post "comment/create"
  post "user/create"
  post "user/login_check"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
