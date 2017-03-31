class Review < ActiveRecord::Base
    belongs_to :game

    has_many :comments
end
