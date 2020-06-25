require_relative './config/env'
require 'require_all'

use Rack::MethodOverride
use SessionsController
use ListsController
run ApplicationController
