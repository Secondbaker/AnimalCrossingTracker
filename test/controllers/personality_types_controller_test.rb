require 'test_helper'

class PersonalityTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personality_type = personality_types(:one)
  end

  test "should get index" do
    get personality_types_url
    assert_response :success
  end

  test "should get new" do
    get new_personality_type_url
    assert_response :success
  end

  test "should create personality_type" do
    assert_difference('PersonalityType.count') do
      post personality_types_url, params: { personality_type: { value: @personality_type.value } }
    end

    assert_redirected_to personality_type_url(PersonalityType.last)
  end

  test "should show personality_type" do
    get personality_type_url(@personality_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_personality_type_url(@personality_type)
    assert_response :success
  end

  test "should update personality_type" do
    patch personality_type_url(@personality_type), params: { personality_type: { value: @personality_type.value } }
    assert_redirected_to personality_type_url(@personality_type)
  end

  test "should destroy personality_type" do
    assert_difference('PersonalityType.count', -1) do
      delete personality_type_url(@personality_type)
    end

    assert_redirected_to personality_types_url
  end
end
