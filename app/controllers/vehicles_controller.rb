class VehiclesController < ApplicationController

    before ['/vehicles/create', '/vehicles/new'] do 
        if current_user.nil?
            flash[:notice] = 'Login required.'
            redirect '/login'
        end
    end

    get '/vehicles' do
        @vehicles = Vehicle.all
        erb :'vehicles/index'
    end

    get '/vehicles/new' do
        erb :'vehicles/new'
    end 

    get '/vehicles/:id' do
        @vehicle = Vehicle.find(params[:id]) 
        erb :'vehicles/show'
    end

    post '/vehicles/create' do 
        @vehicle = current_user.vehicles.create(params)

        if @vehicle.save 
            flash[:message] = "Created!"
            redirect "/vehicles/#{@vehicle.id}"
        else 
            flash[:message] = @vehicle.errors.full_messages.join(" ") # Fix later on
            redirect '/vehicles/new'
        end
    end

    get '/vehicles/:id/edit' do
        
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.user_id == session[:user_id]
            erb :'/vehicles/edit'
        else
            puts "NA"
        end
    end

    delete 'vehicles/:id' do 
        @vehicle = current_user.vehicles.find(params[:id])
    end

end