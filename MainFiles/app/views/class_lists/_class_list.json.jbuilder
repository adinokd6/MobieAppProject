json.extract! class_list, :id, :ClassListId
json.students class_list.students do |student|
  json.FirstName student.FirstName
  json.SecondName student.SecondName
  json.StudentId student.StudentId
end
