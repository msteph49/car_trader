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
        @user = current_user
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

    get "/vehicles/:id/edit" do 
        @vehicle = current_user.vehicles.find(params[:id])
    
        if @vehicle
            erb :'vehicles/edit'
        else
            flash[:error] = "No vehicle found."
            redirect '/vehicles'
        end
    end

    patch "/vehicles/:id" do 

        if @vehicle = current_user.vehicles.update(params)
            flash[:success] = "Vehicle updated."
            redirect "/vehicles/#{@vehicle.id}"
        else
            flash[:error] = "Unable to update."
            redirect '/vehicles'
        end
    end

    put "/vehicles/:id" do 
        @vehicle = current_user.vehicles.find(params[:id])
    
        if @vehicle.nil?
            flash[:error] = "Vehicle not found."
            redirect "/vehicles"
        end
    
        vehicle_params = params[:vehicle]
    
    
        if @vehicle.update(vehicle_params)
            flash[:success] = "Vehicle updated."
            redirect "/vehicles/#{@vehicle.id}"
        else
            flash[:error] = "Unable to update."
            redirect '/vehicles'
        end
    end
    delete "/vehicles/:id" do 
        @vehicle = current_user.vehicles.find(params[:id])
    
        if @vehicle.nil?
            flash[:error] = "Vehicle not found."
            redirect "/vehicles"
        end
    
        if @vehicle.destroy 
            flash[:success] = "Vehicle has been deleted."
            redirect "/vehicles"
        else 
            flash[:error] = @vehicle.errors.full_messages.join(" ") # fix later
            redirect "/vehicles"
        end
    end
end