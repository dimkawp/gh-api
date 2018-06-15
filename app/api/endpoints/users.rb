module Endpoints
  class Users < Grape::API
    namespace :users do
      # get user fragments

      get 'user', jbuilder: 'fragments' do
        payload = { data: 'test' }
        token = JWT.encode payload, nil, 'none'
        decoded_token = JWT.decode token, nil, false
        p [token,decoded_token]
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
        if user = User.find_by(name: params[:name], password: params[:password])
          token = JWT.encode user.email, nil, 'none'
          if user.role === 'admin'
            result = true
          else
            result = false
          end
          {login: 'true', admin: result, token: token}
        else
          {login: 'false'}
        end
      end

      #message
      params do
        requires :name, type: String, desc: 'Name'
        requires :mail, type: String, desc: 'Mail'
        requires :text, type: String, desc: 'Text'
      end
      post 'message', jbuilder: 'message' do
        name = params[:name]
        mail = params[:mail]
        text = params[:text]
        if message = MessageMailer.new_message(name,mail,text).deliver
          {message: 'Message Write'}
        else
          message.error
        end

      end
      #testWorker
      params do
        requires :token, type: String, desc: 'User TOKEN'
      end
      post 'token', jbuilder: 'token' do
        decoded_token = JWT.decode params[:token], nil, false
          if user = User.find_by(email: decoded_token.first)
          {name: user.name,email: user.email, role: user.role}
          else
          {error: 'failed token'}
          end
      end
    end
  end
end
