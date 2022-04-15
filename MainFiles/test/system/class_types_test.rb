require "application_system_test_case"

class ClassTypesTest < ApplicationSystemTestCase
  setup do
    @class_type = class_types(:one)
  end

  test "visiting the index" do
    visit class_types_url
    assert_selector "h1", text: "Class Types"
  end

  test "creating a Class type" do
    visit class_types_url
    click_on "New Class Type"

    fill_in "Classid", with: @class_type.ClassId
    fill_in "Period", with: @class_type.Period
    fill_in "Time", with: @class_type.Time
    fill_in "Animal", with: @class_type.animal_id
    click_on "Create Class type"

    assert_text "Class type was successfully created"
    click_on "Back"
  end

  test "updating a Class type" do
    visit class_types_url
    click_on "Edit", match: :first

    fill_in "Classid", with: @class_type.ClassId
    fill_in "Period", with: @class_type.Period
    fill_in "Time", with: @class_type.Time
    fill_in "Animal", with: @class_type.animal_id
    click_on "Update Class type"

    assert_text "Class type was successfully updated"
    click_on "Back"
  end

  test "destroying a Class type" do
    visit class_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class type was successfully destroyed"
  end
end
