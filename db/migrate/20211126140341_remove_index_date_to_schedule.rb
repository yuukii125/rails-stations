class RemoveIndexDateToSchedule < ActiveRecord::Migration[6.1]
  def change
    remove_index :reservations, [:date, :schedule_id], unique: true
  end
end
