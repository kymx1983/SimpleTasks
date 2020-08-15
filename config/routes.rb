Rails.application.routes.draw do
  get 'task/index'
  get "task/show/:id" => "task#show"
  get 'task/new'
  post "task/create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
