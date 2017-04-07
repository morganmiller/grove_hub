class Api::ApiController < ActionController::Base
    before_action :authenticate_user!

end
