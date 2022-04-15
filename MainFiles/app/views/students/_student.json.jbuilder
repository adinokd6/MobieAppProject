json.extract! student, :id, :StudentId, :FirstName, :SecondName, :DateOfBirth, :grade_id, :created_at, :updated_at
json.url student_url(student, format: :json)
