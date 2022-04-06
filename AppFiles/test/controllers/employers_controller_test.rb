require 'test_helper'

class EmployersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employer = employers(:one)
  end

  test "should get index" do
    get employers_url
    assert_response :success
  end

  test "should get new" do
    get new_employer_url
    assert_response :success
  end

  test "should create employer" do
    assert_difference('Employer.count') do
      post employers_url, params: { employer: { EmailId: @employer.EmailId, EmployerId: @employer.EmployerId, email_id: @employer.email_id } }
    end

    assert_redirected_to employer_url(Employer.last)
  end

  test "should show employer" do
    get employer_url(@employer)
    assert_response :success
  end

  test "should get edit" do
    get edit_employer_url(@employer)
    assert_response :success
  end

  test "should update employer" do
    patch employer_url(@employer), params: { employer: { EmailId: @employer.EmailId, EmployerId: @employer.EmployerId, email_id: @employer.email_id } }
    assert_redirected_to employer_url(@employer)
  end

  test "should destroy employer" do
    assert_difference('Employer.count', -1) do
      delete employer_url(@employer)
    end

    assert_redirected_to employers_url
  end
end
