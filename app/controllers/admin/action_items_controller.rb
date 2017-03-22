class Admin::ActionItemsController < Admin::BaseController
  def index
    @action_items = ActionItem.all
  end

  def create
    category = Category.find(params[:category])
    action_item = category.action_items.new(action_item_params)
    if action_item.save
      flash[:notice] = "Action successfully created!"
      redirect_to admin_action_items_path#(action_item.id)
    else
      flash[:errors] = action_item.errors.full_messages.join(", ")
      redirect_to new_admin_action_item_path
    end
  end

  def new
    @action_item = ActionItem.new
    @categories = Category.all
  end

  def destroy
    action_item = ActionItem.find(params[:id])
    action_item.destroy!
    flash[:notice] = "Action deleted successfully"
    redirect_to admin_action_items_path
  end

  private

  def action_item_params
    params.require(:action_item).permit(:description, :category_id)
  end

end
