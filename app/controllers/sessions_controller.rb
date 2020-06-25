class SessionsController < ApplicationController

    get '/signup' do
        erb :'sessions/signup'
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        u = User.find_by(username: params[:username])

        if u && u.authenticate(params[:password])
            session[:user_id] = u.id
            redirect '/lists'
        else
            @err = "Invalid Credentials"
            erb :'sessions/login'
        end
    end

    post '/signup' do
        @u = User.new(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
        if @u.save
            session[:user_id] = @u.id
            redirect "/lists"
        else
            erb :'sessions/signup'
        end
    end

    delete '/logout' do
        session.clear
        redirect '/login'
    end

end
