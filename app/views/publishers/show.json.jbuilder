json.extract! @publisher, :id, :name
json.reviews @publisher.reviews, :id, :title, :score, :game

       
