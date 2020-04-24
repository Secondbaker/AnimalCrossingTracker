require 'test_helper'

class NumberCollectibleAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_collectible_attribute = number_collectible_attributes(:one)
  end

  test "should get index" do
    get number_collectible_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_number_collectible_attribute_url
    assert_response :success
  end

  test "should create number_collectible_attribute" do
    assert_difference('NumberCollectibleAttribute.count') do
      post number_collectible_attributes_url, params: { number_collectible_attribute: { value: @number_collectible_attribute.value } }
    end

    assert_redirected_to number_collectible_attribute_url(NumberCollectibleAttribute.last)
  end

  test "should show number_collectible_attribute" do
    get number_collectible_attribute_url(@number_collectible_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_number_collectible_attribute_url(@number_collectible_attribute)
    assert_response :success
  end

  test "should update number_collectible_attribute" do
    patch number_collectible_attribute_url(@number_collectible_attribute), params: { number_collectible_attribute: { value: @number_collectible_attribute.value } }
    assert_redirected_to number_collectible_attribute_url(@number_collectible_attribute)
  end

  test "should destroy number_collectible_attribute" do
    assert_difference('NumberCollectibleAttribute.count', -1) do
      delete number_collectible_attribute_url(@number_collectible_attribute)
    end

    assert_redirected_to number_collectible_attributes_url
  end
end
