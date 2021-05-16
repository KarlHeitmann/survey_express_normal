class AddFavouriteToRoomMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :room_messages, :favourite, :boolean, default: false
  end
end
