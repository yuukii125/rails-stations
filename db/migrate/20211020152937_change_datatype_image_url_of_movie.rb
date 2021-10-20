class ChangeDatatypeImageUrlOfMovie < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :image_url, :string
  end
end
