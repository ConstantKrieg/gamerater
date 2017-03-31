class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :score
      t.integer :user_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
