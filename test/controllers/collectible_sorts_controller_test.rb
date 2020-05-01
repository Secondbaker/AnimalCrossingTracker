require 'test_helper'

class CollectibleSortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_sort = collectible_sorts(:one)
  end

  test "should get index" do
    get collectible_sorts_url
    assert_response :success
  end

  test "should get new" do
    get new_collectible_sort_url
    assert_response :success
  end

  test "should create collectible_sort" do
    assert_difference('CollectibleSort.count') do
      post collectible_sorts_url, params: { collectible_sort: { collectible_attribute_class_name: @collectible_sort.collectible_attribute_class_name, keyword: @collectible_sort.keyword, name: @collectible_sort.name } }
    end

    assert_redirected_to collectible_sort_url(CollectibleSort.last)
  end

  test "should show collectible_sort" do
    get collectible_sort_url(@collectible_sort)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectible_sort_url(@collectible_sort)
    assert_response :success
  end

  test "should update collectible_sort" do
    patch collectible_sort_url(@collectible_sort), params: { collectible_sort: { collectible_attribute_class_name: @collectible_sort.collectible_attribute_class_name, keyword: @collectible_sort.keyword, name: @collectible_sort.name } }
    assert_redirected_to collectible_sort_url(@collectible_sort)
  end

  test "should destroy collectible_sort" do
    assert_difference('CollectibleSort.count', -1) do
      delete collectible_sort_url(@collectible_sort)
    end

    assert_redirected_to collectible_sorts_url
  end
end
