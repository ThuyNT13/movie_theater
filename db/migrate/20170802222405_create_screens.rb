class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|
      t.integer :room_no
      t.integer :capacity

      t.timestamps
    end
  end
end
