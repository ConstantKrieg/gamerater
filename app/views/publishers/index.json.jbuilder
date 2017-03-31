
json.array! (@publishers) do |publisher|
    json.extract! publisher, :id, :name
end    
