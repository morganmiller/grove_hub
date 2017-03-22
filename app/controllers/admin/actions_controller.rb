class Admin::ActionsController < Admin::BaseController
  def index
    @actions = Action.all
  end
end
