module Endpoints
  class Users < Grape::API
    namespace :users do
      # get user fragments

      get 'user', jbuilder: 'fragments' do
        p 'user request'
      end
    end
  end
end
