Rails.application.routes.draw do
  post 'graphql' => 'graphql#execute'
end
