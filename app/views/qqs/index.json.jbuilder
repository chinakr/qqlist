json.array!(@qqs) do |qq|
  json.extract! qq, :number, :list_id, :status
  json.url qq_url(qq, format: :json)
end
