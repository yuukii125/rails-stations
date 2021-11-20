class ChangeDatatypeStartTimeOfSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :start_time, :time, null: false
    change_column :schedules, :end_time, :time, null: false
  end
end
