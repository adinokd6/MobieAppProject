json.extract! employee, :id, :EmployeeId, :EmailId

json.teacher do
  if !employee.teacher.nil?
    json.FirstName employee.teacher.FirstName
    json.SecondName employee.teacher.LastName
  end
end
json.trainer do
  if !employee.trainer.nil?
    json.FirstName employee.trainer.FirstName
    json.SecondName employee.trainer.LastName
  end
end
