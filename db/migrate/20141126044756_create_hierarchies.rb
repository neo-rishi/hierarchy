class CreateHierarchies < ActiveRecord::Migration
  def change
    create_table :hierarchies do |t|
      t.string :name
      t.integer :parent_id, :null => false, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
