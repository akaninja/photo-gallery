class AddStatusToAlbum < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :status, :integer
  end
end
