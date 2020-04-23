require 'test_helper'

class StringCollectibleAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @string_collectible_attribute = string_collectible_attributes(:one)
  end

  test "should get index" do
    get string_collectible_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_string_collectible_attribute_url
    assert_response :success
  end

  test "should create string_collectible_attribute" do
    assert_difference('StringCollectibleAttribute.count') do
      post string_collectible_attributes_url, params: { string_collectible_attribute: { value: @string_collectible_attribute.value } }
    end

    assert_redirected_to string_collectible_attribute_url(StringCollectibleAttribute.last)
  end

  test "should show string_collectible_attribute" do
    get string_collectible_attribute_url(@string_collectible_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_string_collectible_attribute_url(@string_collectible_attribute)
    assert_response :success
  end

  test "should update string_collectible_attribute" do
    patch string_collectible_attribute_url(@string_collectible_attribute), params: { string_collectible_attribute: { value: @string_collectible_attribute.value } }
    assert_redirected_to string_collectible_attribute_url(@string_collectible_attribute)
  end

  test "should destroy string_collectible_attribute" do
    assert_difference('StringCollectibleAttribute.count', -1) do
      delete string_collectible_attribute_url(@string_collectible_attribute)
    end

    assert_redirected_to string_collectible_attributes_url
  end
end
