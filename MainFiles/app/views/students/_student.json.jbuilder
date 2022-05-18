json.extract! student, :id, :StudentId, :FirstName, :SecondName, :DateOfBirth
json.grades student.grades do |grade|
  json.id grade.id
  json.Grade grade.Grade
  json.date grade.Date
  json.subject_id grade.subject_id
end
json.certificates student.certificates do |certificate|
  json.Name certificate.Name
  json.Grade certificate.Grade
  json.Description certificate.Description
end
