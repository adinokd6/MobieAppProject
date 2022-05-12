json.extract! class_type, :id, :ClassId, :Period
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
