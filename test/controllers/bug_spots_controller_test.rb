require 'test_helper'

class BugSpotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_spot = bug_spots(:one)
  end

  test "should get index" do
    get bug_spots_url
    assert_response :success
  end

  test "should get new" do
    get new_bug_spot_url
    assert_response :success
  end

  test "should create bug_spot" do
    assert_difference('BugSpot.count') do
      post bug_spots_url, params: { bug_spot: {  } }
    end

    assert_redirected_to bug_spot_url(BugSpot.last)
  end

  test "should show bug_spot" do
    get bug_spot_url(@bug_spot)
    assert_response :success
  end

  test "should get edit" do
    get edit_bug_spot_url(@bug_spot)
    assert_response :success
  end

  test "should update bug_spot" do
    patch bug_spot_url(@bug_spot), params: { bug_spot: {  } }
    assert_redirected_to bug_spot_url(@bug_spot)
  end

  test "should destroy bug_spot" do
    assert_difference('BugSpot.count', -1) do
      delete bug_spot_url(@bug_spot)
    end

    assert_redirected_to bug_spots_url
  end
end
