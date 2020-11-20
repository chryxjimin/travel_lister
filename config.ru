require './config/environment'

use Rack::MethodOverride
use UsersController
use ListsController
run ApplicationController
