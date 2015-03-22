json.array!(@guests) do |guest|
  json.extract! guest, :id, :guest_name, :guest_email, :event_id
  json.url guest_url(guest, format: :json)
end
