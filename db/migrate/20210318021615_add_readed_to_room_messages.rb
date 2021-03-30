class AddReadedToRoomMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :room_messages, :readed, :boolean, null: false, default: false
  end
end
