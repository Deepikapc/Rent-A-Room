class RemoveColumnToRooms < ActiveRecord::Migration
  def change
  	remove_column :rooms, :is_authorized
  end
end
