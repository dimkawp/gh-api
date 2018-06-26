Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://gh-homework-13.herokuapp.com', 'https://my-self-prod.herokuapp.com/', 'http://localhost:3000', 'http://localhost:3001'
    resource '*',
             headers: :any,
             methods: %i(get post put patch delete options head)
  end
end