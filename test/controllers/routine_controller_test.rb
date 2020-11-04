require 'test_helper'

class RoutineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get routine_index_url
    assert_response :success
  end

  test "should get show" do
    get routine_show_url
    assert_response :success
  end

  test "should get new" do
    get routine_new_url
    assert_response :success
  end

end
