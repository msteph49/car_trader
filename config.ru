require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end
use UsersController
use VehiclesController
run ApplicationController
# if you want to add additional controllers use
# use controller_name