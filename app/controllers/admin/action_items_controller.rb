class Admin::ActionItemsController < Admin::BaseController
  def index
    @action_items = ActionItem.all
  end

  def create
    @action_item = ActionItem.new(action_item_params)
    if @action_item.save
      flash[:notice] = "Action successfully created!"
      redirect_to admin_action_items_path#(@action_item.id)
    else
      flash[:errors] = @item.errors.full_messages.join(", ")
      redirect_to new_admin_action_item_path
    end
  end

  def new
    @action_item = ActionItem.new
  end

  private

  def action_item_params
    params.require(:action_item).permit(:description)
  end

end
