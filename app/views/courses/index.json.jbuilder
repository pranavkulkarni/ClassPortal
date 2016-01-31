json.array!(@courses) do |course|
  json.extract! course, :id, :courseNumber, :title, :description, :instructor, :startDate, :endDate, :status
  json.url course_url(course, format: :json)
end
