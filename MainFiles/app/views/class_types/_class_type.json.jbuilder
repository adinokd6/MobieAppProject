json.extract! class_type, :id, :ClassId, :Period, :Time, :created_at, :updated_at
json.class_room do
  if !class_type.class_room.nil?
    json.ClassRoomNumber class_type.class_room.RoomNumber
  end
end
