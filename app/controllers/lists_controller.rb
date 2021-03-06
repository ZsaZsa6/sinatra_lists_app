class ListsController < ApplicationController

    get '/lists' do
        authenticate
        @lists = current_user.lists
        erb :'/lists/index'
    end

    get '/lists/new' do
        authenticate
        erb :'/lists/new'
    end

    get '/lists/:id' do
        @list = List.find(params[:id])
        authorize(@list)
        erb :'/lists/show'
    end

    post '/lists' do
        authenticate
      @list = List.create(category: params[:category], title: params[:title], content: params[:content], user: current_user)
        if @list.save
        redirect '/lists'
        else flash[:validate] = "Make sure you have supplied a title and content for your list"
        erb :'/lists/new'
        end
    end

    get '/lists/:id/edit' do
        @list = List.find(params[:id])
        authorize(@list)
        erb :'/lists/edit'
    end

    patch '/lists/:id' do
        @list = List.find(params[:id])
        authorize(@list)
        @list.update(category: params[:category], title: params[:title], content: params[:content])
        redirect '/lists'
    end

    delete '/lists/:id' do
        l = List.find(params[:id])
        authorize(l)
        l.destroy
        redirect '/lists'
    end
end
