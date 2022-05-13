json.extract! teacher, :id, :TeacherId, :FirstName, :LastName, :Title, :created_at, :updated_at

json.subjects teacher.subjects do |subject|
  json.subject_id subject.SubjectId
  json.description subject.Description
end
