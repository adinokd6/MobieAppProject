require 'test_helper'

class ClassRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_room = class_rooms(:one)
  end

  test "should get index" do
    get class_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_class_room_url
    assert_response :success
  end

  test "should create class_room" do
    assert_difference('ClassRoom.count') do
      post class_rooms_url, params: { class_room: { Capacity: @class_room.Capacity, ClassRoomId: @class_room.ClassRoomId, Facilities: @class_room.Facilities, RoomNumber: @class_room.RoomNumber, RoomType: @class_room.RoomType } }
    end

    assert_redirected_to class_room_url(ClassRoom.last)
  end

  test "should show class_room" do
    get class_room_url(@class_room)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_room_url(@class_room)
    assert_response :success
  end

  test "should update class_room" do
    patch class_room_url(@class_room), params: { class_room: { Capacity: @class_room.Capacity, ClassRoomId: @class_room.ClassRoomId, Facilities: @class_room.Facilities, RoomNumber: @class_room.RoomNumber, RoomType: @class_room.RoomType } }
    assert_redirected_to class_room_url(@class_room)
  end

  test "should destroy class_room" do
    assert_difference('ClassRoom.count', -1) do
      delete class_room_url(@class_room)
    end

    assert_redirected_to class_rooms_url
  end
end
