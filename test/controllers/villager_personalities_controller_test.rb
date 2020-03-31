require 'test_helper'

class VillagerPersonalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @villager_personality = villager_personalities(:one)
  end

  test "should get index" do
    get villager_personalities_url
    assert_response :success
  end

  test "should get new" do
    get new_villager_personality_url
    assert_response :success
  end

  test "should create villager_personality" do
    assert_difference('VillagerPersonality.count') do
      post villager_personalities_url, params: { villager_personality: {  } }
    end

    assert_redirected_to villager_personality_url(VillagerPersonality.last)
  end

  test "should show villager_personality" do
    get villager_personality_url(@villager_personality)
    assert_response :success
  end

  test "should get edit" do
    get edit_villager_personality_url(@villager_personality)
    assert_response :success
  end

  test "should update villager_personality" do
    patch villager_personality_url(@villager_personality), params: { villager_personality: {  } }
    assert_redirected_to villager_personality_url(@villager_personality)
  end

  test "should destroy villager_personality" do
    assert_difference('VillagerPersonality.count', -1) do
      delete villager_personality_url(@villager_personality)
    end

    assert_redirected_to villager_personalities_url
  end
end
