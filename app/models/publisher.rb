class Publisher < ActiveRecord::Base

    has_many :games
    has_many :reviews, through: :games


    def to_s
        self.name
    end    
end
