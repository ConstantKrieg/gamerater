json.extract! @review, :id, :title,:score, :content    
json.comments @review.comments, :user, :content, :created_at    