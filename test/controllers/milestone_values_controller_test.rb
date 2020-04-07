require 'test_helper'

class MilestoneValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milestone_value = milestone_values(:one)
  end

  test "should get index" do
    get milestone_values_url
    assert_response :success
  end

  test "should get new" do
    get new_milestone_value_url
    assert_response :success
  end

  test "should create milestone_value" do
    assert_difference('MilestoneValue.count') do
      post milestone_values_url, params: { milestone_value: { milestone_id: @milestone_value.milestone_id } }
    end

    assert_redirected_to milestone_value_url(MilestoneValue.last)
  end

  test "should show milestone_value" do
    get milestone_value_url(@milestone_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_milestone_value_url(@milestone_value)
    assert_response :success
  end

  test "should update milestone_value" do
    patch milestone_value_url(@milestone_value), params: { milestone_value: { milestone_id: @milestone_value.milestone_id } }
    assert_redirected_to milestone_value_url(@milestone_value)
  end

  test "should destroy milestone_value" do
    assert_difference('MilestoneValue.count', -1) do
      delete milestone_value_url(@milestone_value)
    end

    assert_redirected_to milestone_values_url
  end
end
