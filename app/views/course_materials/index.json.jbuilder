json.array!(@course_materials) do |course_material|
  json.extract! course_material, :id, :title, :message
  json.url course_material_url(course_material, format: :json)
end
