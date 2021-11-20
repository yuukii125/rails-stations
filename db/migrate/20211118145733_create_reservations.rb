class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.references :schedule, type: :bigint, null: false, index: true, foreign_key: true
      t.references :sheet, type: :bigint, null: false, index: true, foreign_key: true
      t.string :email, limit: 255
      t.string :name, limit: 50

      t.timestamps
    end

    add_index :reservations, [:date, :schedule_id], unique: true
  end
end
