class Review < ActiveRecord::Base
    belongs_to :game
    belongs_to :user
    
    has_many :comments

    validates :score, :inclusion => 0..10
end
