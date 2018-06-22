module Endpoints
  class Projects < Grape::API
    namespace :projects do
      #new project add
      params do
        requires :title, type: String, desc: 'title'
        requires :prevTitle, type: String, desc: 'prevTitle'
        requires :links, type: Array, desc: 'links'
        requires :description, type: String, desc: 'description'
        requires :category, type: Array, desc: 'category'
        requires :img, type: String, desc: 'img'
        requires :demoImg, type: Array, desc: 'demoImg'
      end
      post 'create_project', jbuilder: 'create_user' do

        @project = Project.create title: params[:title],
                                  prevTitle: params[:prevTitle],
                                  links: params[:links],
                                  description: params[:description],
                                  category: params[:category],
                                  img: params[:img],
                                  demoImg: params[:demoImg]
        if @project.save
          'Project Created'
        else
          @project.error
        end
      end
      params do
        requires :title, type: String, desc: 'title'
        requires :prevTitle, type: String, desc: 'prevTitle'
        requires :links, type: Array, desc: 'links'
        requires :description, type: String, desc: 'description'
        requires :category, type: Array, desc: 'category'
        requires :img, type: String, desc: 'img'
        requires :demoImg, type: Array, desc: 'demoImg'
      end
      #TEST
      post 'create_project_test', jbuilder: 'create_project_test' do
        newObject = [title: params[:title],
                     prevTitle: params[:prevTitle],
                     links: params[:links],
                     description: params[:description],
                     category: params[:category],
                     img: params[:img],
                     demoImg: params[:demoImg]
        ]
        newObject
      end
    end
  end
end