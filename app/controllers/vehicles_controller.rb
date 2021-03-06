class VehiclesController < ApplicationController

    get '/vehicles' do
        @vehicles = Vehicle.all
        erb :vehicles/index
    end

end