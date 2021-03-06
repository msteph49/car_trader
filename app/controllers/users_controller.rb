class UsersController < ApplicationController

    get'/signup' do
        flash[:message] = "Hello!"
        erb :"users/signup"
    end

    post '/signup' do
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
            redirect '/'
        else 
            flash[:message] = @user.errors.full_messages.join("\n")
            redirect '/signup', user: @user
        end
    end

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(user_name: params[:user_name])

        if @user.nil?
            flash[:message] = "Error"
            redirect '/login'
        end

        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect '/'
        else 
            flash[:message] = "Password Invalid"
            redirect '/login'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end
end