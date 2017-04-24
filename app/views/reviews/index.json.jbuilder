json.array! @reviews do |review|
    json.extract! review, :id, :title,:score
    json.game do 
        json.name review.game.name
    end
end        