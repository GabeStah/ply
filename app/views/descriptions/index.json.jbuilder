json.array!(@descriptions) do |description|
  json.extract! description, :id, :text
  json.url description_url(description, format: :json)
end
