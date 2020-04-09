require 'test_helper'

class RewardTitlePositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reward_title_position = reward_title_positions(:one)
  end

  test "should get index" do
    get reward_title_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_reward_title_position_url
    assert_response :success
  end

  test "should create reward_title_position" do
    assert_difference('RewardTitlePosition.count') do
      post reward_title_positions_url, params: { reward_title_position: {  } }
    end

    assert_redirected_to reward_title_position_url(RewardTitlePosition.last)
  end

  test "should show reward_title_position" do
    get reward_title_position_url(@reward_title_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_reward_title_position_url(@reward_title_position)
    assert_response :success
  end

  test "should update reward_title_position" do
    patch reward_title_position_url(@reward_title_position), params: { reward_title_position: {  } }
    assert_redirected_to reward_title_position_url(@reward_title_position)
  end

  test "should destroy reward_title_position" do
    assert_difference('RewardTitlePosition.count', -1) do
      delete reward_title_position_url(@reward_title_position)
    end

    assert_redirected_to reward_title_positions_url
  end
end
