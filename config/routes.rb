Rails.application.routes.draw do
  get 'task/index'
  get "task/show/:id" => "task#show"
  get "task/destroy/:id" => "task#destroy"
  get "task/edit/:id" => "task#edit"
  get 'task/new'
  post "task/create"
  post "task/update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
