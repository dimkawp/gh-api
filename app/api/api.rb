require 'grape-swagger'

module Api
  class API < Grape::API
    format :json

    helpers do
      def authenticate
        false unless current_user
      end

      def current_user
        token = ApiKey.where(access_token: params[:token]).first
        if token && !token.expired?
          @current_user = User.find(token.user_id)
        else
          false
        end
      end
    end

    mount Endpoints::Users
    mount Endpoints::ApiKeys
    mount Endpoints::Projects
    mount Endpoints::Wok

    add_swagger_documentation hide_documentation_path: true,
                              api_version: 'v1',
                              format: :json
  end
end
