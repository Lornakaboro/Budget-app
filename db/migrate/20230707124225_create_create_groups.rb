class CreateCreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :create_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
