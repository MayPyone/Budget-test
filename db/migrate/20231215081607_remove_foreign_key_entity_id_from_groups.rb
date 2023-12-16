class RemoveForeignKeyEntityIdFromGroups < ActiveRecord::Migration[7.1]
  def change
    remove_reference :groups, :entity, index: true
  end
end
