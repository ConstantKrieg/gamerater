class RenameGamePlatformToGamesPlatform < ActiveRecord::Migration
  def change
    rename_table :game_platforms, :games_platforms
  end
end
