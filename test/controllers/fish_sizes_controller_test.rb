require 'test_helper'

class FishSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fish_size = fish_sizes(:one)
  end

  test "should get index" do
    get fish_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_fish_size_url
    assert_response :success
  end

  test "should create fish_size" do
    assert_difference('FishSize.count') do
      post fish_sizes_url, params: { fish_size: { name: @fish_size.name } }
    end

    assert_redirected_to fish_size_url(FishSize.last)
  end

  test "should show fish_size" do
    get fish_size_url(@fish_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_fish_size_url(@fish_size)
    assert_response :success
  end

  test "should update fish_size" do
    patch fish_size_url(@fish_size), params: { fish_size: { name: @fish_size.name } }
    assert_redirected_to fish_size_url(@fish_size)
  end

  test "should destroy fish_size" do
    assert_difference('FishSize.count', -1) do
      delete fish_size_url(@fish_size)
    end

    assert_redirected_to fish_sizes_url
  end
end
