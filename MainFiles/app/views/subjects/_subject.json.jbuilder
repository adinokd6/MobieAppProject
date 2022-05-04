json.extract! subject, :id, :SubjectId, :Description, :MaxCapacity, :teacher_id, :trainer_id, :created_at, :updated_at
json.class_types subject.class_types do |class_type|
  json.id class_type.ClassId
  json.period class_type.Period
  json.time class_type.Time
end
