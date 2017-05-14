class Review < ActiveRecord::Base
    belongs_to :game
    belongs_to :user
    
    has_many :comments

    validates :title, presence: true
    validates :score, :inclusion => 0..10
    validates :content, presence: true
end
