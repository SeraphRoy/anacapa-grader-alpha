json.array!(@students) do |student|
  json.extract! student, :id, :studentid, :email, :first_name, :last_name
  json.url student_url(student, format: :json)
end
