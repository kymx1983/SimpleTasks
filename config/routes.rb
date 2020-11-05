Rails.application.routes.draw do
  get 'routine/index'
  get 'routine/show'
  get 'routine/new'
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
  get "routine/show/:id" => "routine#show"
  get "routine/destroy/:id" => "routine#destroy"
  get "routine/edit/:id" => "routine#edit"
  get 'task/new'
  post "task/search"
  post "task/create_task_do"
  post "task/close"
  post "task/cancel_status"
  post "task/create"
  post "task/update"
  post "comment/create"
  post "user/create"
  post "user/login_check"
  post "routine/create"
  post "routine/update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
