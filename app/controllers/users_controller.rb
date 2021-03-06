class UsersController < ApplicationController

    get'/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        user = User.new(params)

        user.save


    end
    get '/login' do
        erb :"users/login"
    end
    post '/login' do

    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end
end