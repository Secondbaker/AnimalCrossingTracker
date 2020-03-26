require 'test_helper'

class ShadowSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shadow_size = shadow_sizes(:one)
  end

  test "should get index" do
    get shadow_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_shadow_size_url
    assert_response :success
  end

  test "should create shadow_size" do
    assert_difference('ShadowSize.count') do
      post shadow_sizes_url, params: { shadow_size: { fishsize_id: @shadow_size.fishsize_id } }
    end

    assert_redirected_to shadow_size_url(ShadowSize.last)
  end

  test "should show shadow_size" do
    get shadow_size_url(@shadow_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_shadow_size_url(@shadow_size)
    assert_response :success
  end

  test "should update shadow_size" do
    patch shadow_size_url(@shadow_size), params: { shadow_size: { fishsize_id: @shadow_size.fishsize_id } }
    assert_redirected_to shadow_size_url(@shadow_size)
  end

  test "should destroy shadow_size" do
    assert_difference('ShadowSize.count', -1) do
      delete shadow_size_url(@shadow_size)
    end

    assert_redirected_to shadow_sizes_url
  end
end
