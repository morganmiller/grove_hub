class Admin::ActionsController < Admin::BaseController
  def index
    @actions = Action.all
  end

  def create
    binding.pry
    @item = Action.new(action_params)
    if @action.save
      flash[:notice] = "Action successfully created!"
      redirect_to admin_action_path#(@action.id)
    else
      flash[:errors] = @item.errors.full_messages.join(", ")
      redirect_to new_admin_action_path
    end
  end

  def new
    @action = Action.new
  end

  private

  def action_params
    params.require(:action).permit(:description)
  end

end
