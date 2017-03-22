class AddCategoryToActionItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :action_items, :category, foreign_key: true
  end
end
