json.array!(@courses) do |course|
  json.extract! course, :id, :dept, :num, :desc, :term
  json.url course_url(course, format: :json)
end
