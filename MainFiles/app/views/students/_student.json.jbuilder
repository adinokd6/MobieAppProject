json.extract! student, :id, :StudentId, :FirstName, :SecondName, :DateOfBirth
json.grades student.grades do |grade|
  json.id grade.id
  json.Grade grade.Grade
  json.date grade.Date
  json.subject_id grade.subject_id
end
