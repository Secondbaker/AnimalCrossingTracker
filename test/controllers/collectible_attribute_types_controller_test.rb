require 'test_helper'

class CollectibleAttributeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_attribute_type = collectible_attribute_types(:one)
  end

  test "should get index" do
    get collectible_attribute_types_url
    assert_response :success
  end

  test "should get new" do
    get new_collectible_attribute_type_url
    assert_response :success
  end

  test "should create collectible_attribute_type" do
    assert_difference('CollectibleAttributeType.count') do
      post collectible_attribute_types_url, params: { collectible_attribute_type: { name: @collectible_attribute_type.name } }
    end

    assert_redirected_to collectible_attribute_type_url(CollectibleAttributeType.last)
  end

  test "should show collectible_attribute_type" do
    get collectible_attribute_type_url(@collectible_attribute_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectible_attribute_type_url(@collectible_attribute_type)
    assert_response :success
  end

  test "should update collectible_attribute_type" do
    patch collectible_attribute_type_url(@collectible_attribute_type), params: { collectible_attribute_type: { name: @collectible_attribute_type.name } }
    assert_redirected_to collectible_attribute_type_url(@collectible_attribute_type)
  end

  test "should destroy collectible_attribute_type" do
    assert_difference('CollectibleAttributeType.count', -1) do
      delete collectible_attribute_type_url(@collectible_attribute_type)
    end

    assert_redirected_to collectible_attribute_types_url
  end
end
