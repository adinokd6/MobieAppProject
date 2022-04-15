require 'test_helper'

class ClassTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_type = class_types(:one)
  end

  test "should get index" do
    get class_types_url
    assert_response :success
  end

  test "should get new" do
    get new_class_type_url
    assert_response :success
  end

  test "should create class_type" do
    assert_difference('ClassType.count') do
      post class_types_url, params: { class_type: { ClassId: @class_type.ClassId, Period: @class_type.Period, Time: @class_type.Time, animal_id: @class_type.animal_id } }
    end

    assert_redirected_to class_type_url(ClassType.last)
  end

  test "should show class_type" do
    get class_type_url(@class_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_type_url(@class_type)
    assert_response :success
  end

  test "should update class_type" do
    patch class_type_url(@class_type), params: { class_type: { ClassId: @class_type.ClassId, Period: @class_type.Period, Time: @class_type.Time, animal_id: @class_type.animal_id } }
    assert_redirected_to class_type_url(@class_type)
  end

  test "should destroy class_type" do
    assert_difference('ClassType.count', -1) do
      delete class_type_url(@class_type)
    end

    assert_redirected_to class_types_url
  end
end
