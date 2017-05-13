json.array! @reviews do |review|
    json.extract! review, :id, :title,:score, :user
    json.game do 
        json.name review.game.name
    end
end        