json.array!(@urls) do |url|
  json.extract! url, :id, :link, :short_link
  json.url url_url(url, format: :json)
end
