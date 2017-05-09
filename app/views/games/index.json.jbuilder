json.array! @games do |game|
    json.extract! game, :id, :name,:publisher, :platforms
    json.publiser do 
        json.name game.publisher.name
    end
    
end  
