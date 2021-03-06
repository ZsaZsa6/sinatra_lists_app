class ApplicationController < Sinatra::Base
    
    enable :sessions
    use Rack::Flash, :sweep => true
    set :session_secret, "my session secret"
    configure do
    set :views, 'app/views'
    end


    get '/' do
        erb :home
    end

    self.helpers do

        def current_user
        @user ||= User.find_by(id: session[:user_id])
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
        def flash_types
              [:warning, :error, :validate]
        end
        
    end
end
