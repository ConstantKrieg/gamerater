json.extract! @game, :id, :name,:publisher, :platforms
json.reviews @game.reviews, :id, :title, :score, :user    