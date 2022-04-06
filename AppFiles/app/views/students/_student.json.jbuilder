json.extract! student, :id, :StudentId, :FirstName, :SecondName, :SchoolTeam, :DateOfBirth, :Points, :Attendance, :created_at, :updated_at
json.url student_url(student, format: :json)
