class CreateScreens < ActiveRecord::Migration[6.1]
  def change
    create_table :screens do |t|
      t.references :movie, type: :integer, null: false, foreign_key: true
      t.integer :screen_number, null: false, limit: 3

      t.timestamps
    end

    add_index :screens, [:movie_id, :screen_number], unique: true
  end
end
