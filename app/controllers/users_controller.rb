class UsersController < ApplicationController

    get'/signup' do
        erb :"users/signup"
    end

    post '/signup' do


    end

    post '/login' do

    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end
end