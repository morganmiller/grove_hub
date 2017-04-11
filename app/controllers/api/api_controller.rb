class Api::ApiController < ActionController::Base
    before_action :authenticate_user!
    #TODO: Test auth working with graphql
end
