class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :movie, type: :integer, null: false, foreign_key: true
      t.string :start_time, null: false
      t.string :end_time, null: false

      t.timestamps
    end
  end
end
