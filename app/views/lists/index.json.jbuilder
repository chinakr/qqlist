json.array!(@lists) do |list|
  json.extract! list, :name
  json.url list_url(list, format: :json)
end
