json.extract! trainer, :id, :TrainerId, :FirstName, :LastName, :created_at, :updated_at
json.subjects trainer.subjects do |subject|
  json.subject_id subject.SubjectId
  json.description subject.Description
end
