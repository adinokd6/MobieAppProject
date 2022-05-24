json.extract! employee, :id, :EmployeeId

json.teacher do
  if !employee.teacher.nil?
    json.FirstName employee.teacher.FirstName
    json.SecondName employee.teacher.LastName
    json.EmailId employee.email.EmailId
  end
end
json.trainer do
  if !employee.trainer.nil?
    json.FirstName employee.trainer.FirstName
    json.SecondName employee.trainer.LastName
    json.EmailId employee.email.EmailId
  end
end
