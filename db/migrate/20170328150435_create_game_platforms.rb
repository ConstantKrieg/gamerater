class CreateGamePlatforms < ActiveRecord::Migration
  def change
    create_table :game_platforms do |t|
      t.belongs_to :game, index: true
      t.belongs_to :platform, index: true
    end
  end
end
