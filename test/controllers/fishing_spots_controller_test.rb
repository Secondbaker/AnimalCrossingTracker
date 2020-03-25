require 'test_helper'

class FishingSpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishing_spot = fishing_spots(:one)
  end

  test "should get index" do
    get fishing_spots_url
    assert_response :success
  end

  test "should get new" do
    get new_fishing_spot_url
    assert_response :success
  end

  test "should create fishing_spot" do
    assert_difference('FishingSpot.count') do
      post fishing_spots_url, params: { fishing_spot: { name: @fishing_spot.name } }
    end

    assert_redirected_to fishing_spot_url(FishingSpot.last)
  end

  test "should show fishing_spot" do
    get fishing_spot_url(@fishing_spot)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishing_spot_url(@fishing_spot)
    assert_response :success
  end

  test "should update fishing_spot" do
    patch fishing_spot_url(@fishing_spot), params: { fishing_spot: { name: @fishing_spot.name } }
    assert_redirected_to fishing_spot_url(@fishing_spot)
  end

  test "should destroy fishing_spot" do
    assert_difference('FishingSpot.count', -1) do
      delete fishing_spot_url(@fishing_spot)
    end

    assert_redirected_to fishing_spots_url
  end
end
