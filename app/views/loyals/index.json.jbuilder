json.array!(@loyals) do |loyal|
  json.extract! loyal, :id, :gender, :age, :region, :year
  json.url loyal_url(loyal, format: :json)
end
