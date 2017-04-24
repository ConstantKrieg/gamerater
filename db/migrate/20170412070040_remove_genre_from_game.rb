class RemoveGenreFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :genre_id
  end
end
