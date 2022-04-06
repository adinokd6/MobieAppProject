require 'test_helper'

class Class1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class1 = class1s(:one)
  end

  test "should get index" do
    get class1s_url
    assert_response :success
  end

  test "should get new" do
    get new_class1_url
    assert_response :success
  end

  test "should create class1" do
    assert_difference('Class1.count') do
      post class1s_url, params: { class1: { ClassId: @class1.ClassId, Period: @class1.Period, Time: @class1.Time, animal_id: @class1.animal_id } }
    end

    assert_redirected_to class1_url(Class1.last)
  end

  test "should show class1" do
    get class1_url(@class1)
    assert_response :success
  end

  test "should get edit" do
    get edit_class1_url(@class1)
    assert_response :success
  end

  test "should update class1" do
    patch class1_url(@class1), params: { class1: { ClassId: @class1.ClassId, Period: @class1.Period, Time: @class1.Time, animal_id: @class1.animal_id } }
    assert_redirected_to class1_url(@class1)
  end

  test "should destroy class1" do
    assert_difference('Class1.count', -1) do
      delete class1_url(@class1)
    end

    assert_redirected_to class1s_url
  end
end
