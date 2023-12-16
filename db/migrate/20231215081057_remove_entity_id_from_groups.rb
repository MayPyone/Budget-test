class RemoveEntityIdFromGroups < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :groups, :entities
  end
end
