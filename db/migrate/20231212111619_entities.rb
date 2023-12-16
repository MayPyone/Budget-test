class Entities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :entity_name 
      t.decimal :amount
      t.references :user, null: false, foreign_key: true
    end
  end
end
