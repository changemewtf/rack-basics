require '06-Middleware'
require '06-Application'

use PrintRequestMiddleware
run Application.new
