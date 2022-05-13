json.extract! class_type, :id, :ClassId, :Period
if !class_type.employee.nil?
    json.tutor do
      if !class_type.employee.teacher.nil?
        json.FirstName class_type.employee.teacher.FirstName
        json.LastName class_type.employee.teacher.LastName
      end
      if !class_type.employee.trainer.nil?
        json.FirstName class_type.employee.trainer.FirstName
        json.LastName class_type.employee.trainer.LastName
      end
    end
end
json.class_room do
  if !class_type.class_room.nil?
    json.ClassRoomNumber class_type.class_room.RoomNumber
  end
end
if !class_type.class_list.nil?
  if !class_type.class_list.students.nil?
    json.students class_type.class_list.students do |student|
      json.FirstName student.FirstName
      json.SecondName student.SecondName
      json.StudentId student.StudentId
    end
  end
end

if !class_type.animals.nil?
    json.animals class_type.animals do |animal|
      json.Name animal.Name
      json.Species animal.Species
    end
end

if !class_type.subjects.nil?
    json.subjects class_type.subjects do |subject|
      json.SubjectId subject.SubjectId
      json.Description subject.Description
    end
end
