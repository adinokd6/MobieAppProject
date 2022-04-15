json.extract! subject, :id, :SubjectId, :Description, :MaxCapacity, :created_at, :updated_at
json.url subject_url(subject, format: :json)
