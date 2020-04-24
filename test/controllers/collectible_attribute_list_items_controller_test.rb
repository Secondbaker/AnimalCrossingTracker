require 'test_helper'

class CollectibleAttributeListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_attribute_list_item = collectible_attribute_list_items(:one)
  end

  test "should get index" do
    get collectible_attribute_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_collectible_attribute_list_item_url
    assert_response :success
  end

  test "should create collectible_attribute_list_item" do
    assert_difference('CollectibleAttributeListItem.count') do
      post collectible_attribute_list_items_url, params: { collectible_attribute_list_item: { collectible_attribute_list_id: @collectible_attribute_list_item.collectible_attribute_list_id, position: @collectible_attribute_list_item.position } }
    end

    assert_redirected_to collectible_attribute_list_item_url(CollectibleAttributeListItem.last)
  end

  test "should show collectible_attribute_list_item" do
    get collectible_attribute_list_item_url(@collectible_attribute_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectible_attribute_list_item_url(@collectible_attribute_list_item)
    assert_response :success
  end

  test "should update collectible_attribute_list_item" do
    patch collectible_attribute_list_item_url(@collectible_attribute_list_item), params: { collectible_attribute_list_item: { collectible_attribute_list_id: @collectible_attribute_list_item.collectible_attribute_list_id, position: @collectible_attribute_list_item.position } }
    assert_redirected_to collectible_attribute_list_item_url(@collectible_attribute_list_item)
  end

  test "should destroy collectible_attribute_list_item" do
    assert_difference('CollectibleAttributeListItem.count', -1) do
      delete collectible_attribute_list_item_url(@collectible_attribute_list_item)
    end

    assert_redirected_to collectible_attribute_list_items_url
  end
end
