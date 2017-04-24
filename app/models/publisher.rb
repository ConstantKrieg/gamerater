class Publisher < ActiveRecord::Base

    has_many :games


    def to_s
        self.name
    end    
end
