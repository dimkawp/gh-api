module Endpoints
  class Users < Grape::API
    namespace :users do
      # get user fragments

      get 'user', jbuilder: 'fragments' do
        p 'test Endpoint user request'
      end
      #created new user
      params do
        requires :name, type: String, desc: 'User NAME'
        requires :email, type: String, desc: 'User MAIL'
        requires :password, type: String, desc: 'User PASSWORD'
      end
      post 'create_user', jbuilder: 'create_user' do
        @user = User.create name: params[:name],
                            email: params[:email],
                            password: params[:password]
        if @user.save
          'user created'
        else
          @user.errors
        end
      end

      #authentication
      params do
        requires :name, type: String, desc: 'User NAME'
        requires :password, type: String, desc: 'User PASSWORD'
      end
      post 'authentication', jbuilder: 'authentication' do
        if User.find_by(name: params[:name], password: params[:password])
          if user.role === 'admin'
            {login: 'true', admin: 'true'}
          else
            {login: 'true', admin: 'false'}
          end
        else
          {login: 'false', admin: 'false'}
        end
      end
    end
  end
end
