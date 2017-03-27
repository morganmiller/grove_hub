class AddActionItemToAlgorithms < ActiveRecord::Migration[5.0]
  def change
    add_reference :algorithms, :action_item, foreign_key: true
  end
end
