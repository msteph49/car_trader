class VehiclesController < ApplicationController

    before ['/vehicles/create'] do 
        if current_user.nil?
            flash[:notice] = 'Login required.'
            redirect '/login'
        end
    end

    get '/vehicles' do
        @vehicles = Vehicle.all
        erb :vehicles/index
    end

    get '/vehicles/create' do
        
    end 

    post '/vehicles/create' do 
        @vehicle = current_user.vehicles.create(params)

        if @vehicle.save 
            flash[:message] = "Created!"
            redirect "/vehicles/#{@vehicle.id}"
        else 
            flash[:message] = @vehicle.errors.full_messages.join(" ") # Fix later on
            redirect "/vehicles/new"
        end
    end

end