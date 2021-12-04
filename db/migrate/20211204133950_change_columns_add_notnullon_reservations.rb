class ChangeColumnsAddNotnullonReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :email, :string, null: false
    change_column :reservations, :name, :string, null: false
  end
end
