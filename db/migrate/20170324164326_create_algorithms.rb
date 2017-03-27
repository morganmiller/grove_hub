class CreateAlgorithms < ActiveRecord::Migration[5.0]
  def change
    create_table :algorithms do |t|
      t.string :formula

      t.timestamps
    end
  end
end
