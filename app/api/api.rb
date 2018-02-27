require 'grape-swagger'

module Api
  class API < Grape::API
    format :json

    mount Endpoints::Users

    add_swagger_documentation hide_documentation_path: true,
                              api_version: 'v1',
                              format: :json
  end
end
