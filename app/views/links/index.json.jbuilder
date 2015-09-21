json.array!(@links) do |link|
  json.extract! link, :id, :in-url, :out-url, :count
  json.url link_url(link, format: :json)
end
