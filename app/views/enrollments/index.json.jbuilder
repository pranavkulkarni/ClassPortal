json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :status
  json.url enrollment_url(enrollment, format: :json)
end
