class Publisher < ActiveRecord::Base

    has_many :games
    has_many :reviews, through: :games

    validates :name, presence: true

    def to_s
        self.name
    end    
end
