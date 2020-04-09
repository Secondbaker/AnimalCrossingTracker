require 'test_helper'

class RewardTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reward_title = reward_titles(:one)
  end

  test "should get index" do
    get reward_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_reward_title_url
    assert_response :success
  end

  test "should create reward_title" do
    assert_difference('RewardTitle.count') do
      post reward_titles_url, params: { reward_title: {  } }
    end

    assert_redirected_to reward_title_url(RewardTitle.last)
  end

  test "should show reward_title" do
    get reward_title_url(@reward_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_reward_title_url(@reward_title)
    assert_response :success
  end

  test "should update reward_title" do
    patch reward_title_url(@reward_title), params: { reward_title: {  } }
    assert_redirected_to reward_title_url(@reward_title)
  end

  test "should destroy reward_title" do
    assert_difference('RewardTitle.count', -1) do
      delete reward_title_url(@reward_title)
    end

    assert_redirected_to reward_titles_url
  end
end
