require "application_system_test_case"

class ClassRoomsTest < ApplicationSystemTestCase
  setup do
    @class_room = class_rooms(:one)
  end

  test "visiting the index" do
    visit class_rooms_url
    assert_selector "h1", text: "Class Rooms"
  end

  test "creating a Class room" do
    visit class_rooms_url
    click_on "New Class Room"

    fill_in "Capacity", with: @class_room.Capacity
    fill_in "Classroomid", with: @class_room.ClassRoomId
    fill_in "Facilities", with: @class_room.Facilities
    fill_in "Roomnumber", with: @class_room.RoomNumber
    fill_in "Roomtype", with: @class_room.RoomType
    click_on "Create Class room"

    assert_text "Class room was successfully created"
    click_on "Back"
  end

  test "updating a Class room" do
    visit class_rooms_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @class_room.Capacity
    fill_in "Classroomid", with: @class_room.ClassRoomId
    fill_in "Facilities", with: @class_room.Facilities
    fill_in "Roomnumber", with: @class_room.RoomNumber
    fill_in "Roomtype", with: @class_room.RoomType
    click_on "Update Class room"

    assert_text "Class room was successfully updated"
    click_on "Back"
  end

  test "destroying a Class room" do
    visit class_rooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class room was successfully destroyed"
  end
end
