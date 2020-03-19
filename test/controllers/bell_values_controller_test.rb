require 'test_helper'

class BellValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bell_value = bell_values(:one)
  end

  test "should get index" do
    get bell_values_url
    assert_response :success
  end

  test "should get new" do
    get new_bell_value_url
    assert_response :success
  end

  test "should create bell_value" do
    assert_difference('BellValue.count') do
      post bell_values_url, params: { bell_value: { collectible_id: @bell_value.collectible_id, value: @bell_value.value } }
    end

    assert_redirected_to bell_value_url(BellValue.last)
  end

  test "should show bell_value" do
    get bell_value_url(@bell_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_bell_value_url(@bell_value)
    assert_response :success
  end

  test "should update bell_value" do
    patch bell_value_url(@bell_value), params: { bell_value: { collectible_id: @bell_value.collectible_id, value: @bell_value.value } }
    assert_redirected_to bell_value_url(@bell_value)
  end

  test "should destroy bell_value" do
    assert_difference('BellValue.count', -1) do
      delete bell_value_url(@bell_value)
    end

    assert_redirected_to bell_values_url
  end
end
