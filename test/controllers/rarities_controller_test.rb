require 'test_helper'

class RaritiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rarity = rarities(:one)
  end

  test "should get index" do
    get rarities_url
    assert_response :success
  end

  test "should get new" do
    get new_rarity_url
    assert_response :success
  end

  test "should create rarity" do
    assert_difference('Rarity.count') do
      post rarities_url, params: { rarity: { collectible_id: @rarity.collectible_id, value: @rarity.value } }
    end

    assert_redirected_to rarity_url(Rarity.last)
  end

  test "should show rarity" do
    get rarity_url(@rarity)
    assert_response :success
  end

  test "should get edit" do
    get edit_rarity_url(@rarity)
    assert_response :success
  end

  test "should update rarity" do
    patch rarity_url(@rarity), params: { rarity: { collectible_id: @rarity.collectible_id, value: @rarity.value } }
    assert_redirected_to rarity_url(@rarity)
  end

  test "should destroy rarity" do
    assert_difference('Rarity.count', -1) do
      delete rarity_url(@rarity)
    end

    assert_redirected_to rarities_url
  end
end
