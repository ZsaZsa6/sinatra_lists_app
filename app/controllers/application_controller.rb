class ApplicationController < Sinatra::Base

    set :views, ->{ File.join(root, "../views") }
    enable :sessions

    get '/' do
        erb :home
    end


    self.helpers do

        def current_user
            User.find_by(id: session[:user_id])
        end

        def logged_in?
            !!current_user
        end

        def authenticate
            redirect '/login' if !logged_in?
        end

        def authorize(list)
            authenticate
            redirect '/lists' if list.user != current_user
        end
