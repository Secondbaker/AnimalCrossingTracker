require 'test_helper'

class IslandCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @island_collection = island_collections(:one)
  end

  test "should get index" do
    get island_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_island_collection_url
    assert_response :success
  end

  test "should create island_collection" do
    assert_difference('IslandCollection.count') do
      post island_collections_url, params: { island_collection: { thumbnail: @island_collection.thumbnail, title: @island_collection.title } }
    end

    assert_redirected_to island_collection_url(IslandCollection.last)
  end

  test "should show island_collection" do
    get island_collection_url(@island_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_island_collection_url(@island_collection)
    assert_response :success
  end

  test "should update island_collection" do
    patch island_collection_url(@island_collection), params: { island_collection: { thumbnail: @island_collection.thumbnail, title: @island_collection.title } }
    assert_redirected_to island_collection_url(@island_collection)
  end

  test "should destroy island_collection" do
    assert_difference('IslandCollection.count', -1) do
      delete island_collection_url(@island_collection)
    end

    assert_redirected_to island_collections_url
  end
end
