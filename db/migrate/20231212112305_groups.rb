class Groups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
    t.string :group_name
    t.string :icon
    t.timestamps
    t.references :user, null: false, foreign_key: true
    t.references :entity, null: false, foreign_key: true
    end
  end
end
