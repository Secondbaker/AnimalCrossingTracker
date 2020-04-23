require 'test_helper'

class CollectibleAttributeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_attribute_list = collectible_attribute_lists(:one)
  end

  test "should get index" do
    get collectible_attribute_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_collectible_attribute_list_url
    assert_response :success
  end

  test "should create collectible_attribute_list" do
    assert_difference('CollectibleAttributeList.count') do
      post collectible_attribute_lists_url, params: { collectible_attribute_list: {  } }
    end

    assert_redirected_to collectible_attribute_list_url(CollectibleAttributeList.last)
  end

  test "should show collectible_attribute_list" do
    get collectible_attribute_list_url(@collectible_attribute_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectible_attribute_list_url(@collectible_attribute_list)
    assert_response :success
  end

  test "should update collectible_attribute_list" do
    patch collectible_attribute_list_url(@collectible_attribute_list), params: { collectible_attribute_list: {  } }
    assert_redirected_to collectible_attribute_list_url(@collectible_attribute_list)
  end

  test "should destroy collectible_attribute_list" do
    assert_difference('CollectibleAttributeList.count', -1) do
      delete collectible_attribute_list_url(@collectible_attribute_list)
    end

    assert_redirected_to collectible_attribute_lists_url
  end
end
