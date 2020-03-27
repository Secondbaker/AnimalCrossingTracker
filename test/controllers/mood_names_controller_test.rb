require 'test_helper'

class MoodNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mood_name = mood_names(:one)
  end

  test "should get index" do
    get mood_names_url
    assert_response :success
  end

  test "should get new" do
    get new_mood_name_url
    assert_response :success
  end

  test "should create mood_name" do
    assert_difference('MoodName.count') do
      post mood_names_url, params: { mood_name: { string: @mood_name.string } }
    end

    assert_redirected_to mood_name_url(MoodName.last)
  end

  test "should show mood_name" do
    get mood_name_url(@mood_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_mood_name_url(@mood_name)
    assert_response :success
  end

  test "should update mood_name" do
    patch mood_name_url(@mood_name), params: { mood_name: { string: @mood_name.string } }
    assert_redirected_to mood_name_url(@mood_name)
  end

  test "should destroy mood_name" do
    assert_difference('MoodName.count', -1) do
      delete mood_name_url(@mood_name)
    end

    assert_redirected_to mood_names_url
  end
end
