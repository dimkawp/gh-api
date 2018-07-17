module Endpoints
  class ApiKeys < Grape::API
    namespace :api_keys do

      #delet all keys
      params do
        requires :password, type: String, desc: 'Password'
      end
      get :delete_all_keys do
        password = '123'
        if password === params[:password]
          ApiKey.destroy_all
        else
          'bad password'
        end

      end

      #auth
      params do
        requires :name, type: String, desc: 'Username'
        requires :password, type: String, desc: 'Password'
      end
      post :login do
        if user = User.find_by(name: params[:name], password: params[:password])
          key = ApiKey.create(user_id: user.id)
          if key.save
            {token: key.access_token}
          else
            key.errors
          end
        else
          error!('Unauthorized.', 401)
        end
      end

      #cheker
      params do
        requires :token, type: String, desc: 'Access token.'
      end
      post :token do
        authenticate
        {object: current_user}
      end
    end
  end
end