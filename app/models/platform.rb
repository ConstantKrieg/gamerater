class Platform < ActiveRecord::Base
    has_and_belongs_to_many :games, :join_table => 'games_platforms'

    validates :title, presence: true
    validates :description, presence: true
end
