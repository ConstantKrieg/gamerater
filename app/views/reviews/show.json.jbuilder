json.extract! @review, :id, :title,:score, :content    
json.comments @review.comments, :id, :user, :content, :created_at
       