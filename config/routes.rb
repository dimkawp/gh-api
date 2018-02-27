require 'sidekiq/web'
require 'sidekiq-status/web'

Rails.application.routes.draw do
  root 'home#index'

  mount Api::API => '/api'
  mount Sidekiq::Web => '/sidekiq'
  mount GrapeSwaggerRails::Engine => '/swagger'

end
