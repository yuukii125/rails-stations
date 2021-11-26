class AddIndexDateToScheduleAndSheet < ActiveRecord::Migration[6.1]
  def down
    add_index :reservations, [:date, :schedule_id], unique: true
  end

  def up
    add_index :reservations, [:date, :schedule_id, :sheet_id], unique: true
  end
end
