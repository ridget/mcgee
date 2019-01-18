Rails.application.routes.draw do
  post 'graphql' => 'graphql#execute'

  get '/graphql_voyager' => 'graphql#index'
end
