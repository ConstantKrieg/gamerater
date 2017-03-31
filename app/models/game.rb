class Game < ActiveRecord::Base


    belongs_to :genre
    belongs_to :publisher

    has_many :reviews, dependent: :destroy
    has_and_belongs_to_many :platforms, :join_table => 'games_platforms'
    has_many :raters, through: :ratings, source: :user

end
