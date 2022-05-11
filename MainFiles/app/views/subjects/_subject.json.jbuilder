json.extract! subject, :id, :SubjectId, :Description, :MaxCapacity
json.ignore_nil!
json.classes subject.class_types do |class_type|
  json.id class_type.ClassId
  json.period class_type.Period
  json.time class_type.Time
end
json.teacher do
  if !subject.teacher.nil?
    json.FirstName subject.teacher.FirstName
    json.SecondName subject.teacher.LastName
  end
end
json.trainer do
  if !subject.trainer.nil?
    json.FirstName subject.trainer.FirstName
    json.SecondName subject.trainer.LastName
  end
end
