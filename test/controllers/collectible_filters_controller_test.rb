require 'test_helper'

class CollectibleFiltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_filter = collectible_filters(:one)
  end

  test "should get index" do
    get collectible_filters_url
    assert_response :success
  end

  test "should get new" do
    get new_collectible_filter_url
    assert_response :success
  end

  test "should create collectible_filter" do
    assert_difference('CollectibleFilter.count') do
      post collectible_filters_url, params: { collectible_filter: { collectible_attribute_class_name: @collectible_filter.collectible_attribute_class_name, keyword: @collectible_filter.keyword, name: @collectible_filter.name } }
    end

    assert_redirected_to collectible_filter_url(CollectibleFilter.last)
  end

  test "should show collectible_filter" do
    get collectible_filter_url(@collectible_filter)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectible_filter_url(@collectible_filter)
    assert_response :success
  end

  test "should update collectible_filter" do
    patch collectible_filter_url(@collectible_filter), params: { collectible_filter: { collectible_attribute_class_name: @collectible_filter.collectible_attribute_class_name, keyword: @collectible_filter.keyword, name: @collectible_filter.name } }
    assert_redirected_to collectible_filter_url(@collectible_filter)
  end

  test "should destroy collectible_filter" do
    assert_difference('CollectibleFilter.count', -1) do
      delete collectible_filter_url(@collectible_filter)
    end

    assert_redirected_to collectible_filters_url
  end
end
