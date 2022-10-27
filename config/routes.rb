Rails.application.routes.draw do
  post '/', to: 'game#index', as: 'game'

  root "game#index"
end
