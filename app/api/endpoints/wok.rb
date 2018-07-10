module Endpoints
  class Wok < Grape::API
    namespace :wok do
      #message
      params do
        requires :name, type: String, desc: 'Name'
        requires :mail, type: String, desc: 'Mail'
        requires :price, type: String, desc: 'Price'
        requires :text, type: String, desc: 'Text'
      end
      post 'message', jbuilder: 'message' do
        name = params[:name]
        mail = params[:mail]
        price = params[:price]
        text = params[:text]
        if MessageWokMailer.new_message(name,mail,price,text).deliver
          {message: 'Message Write'}
        else
          {message: 'Server Error'}
        end
      end
    end
  end
end