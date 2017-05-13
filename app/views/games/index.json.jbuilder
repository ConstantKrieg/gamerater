json.array! @games do |game|
    json.extract! game, :id, :name,:publisher, :platforms   
end  
