class AddGroupToAlgorithms < ActiveRecord::Migration[5.0]
  def change
    add_column :algorithms, :group, :integer
  end
end
