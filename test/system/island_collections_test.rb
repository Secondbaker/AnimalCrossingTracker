require "application_system_test_case"

class IslandCollectionsTest < ApplicationSystemTestCase
  setup do
    @island_collection = island_collections(:one)
  end

  test "visiting the index" do
    visit island_collections_url
    assert_selector "h1", text: "Island Collections"
  end

  test "creating a Island collection" do
    visit island_collections_url
    click_on "New Island Collection"

    fill_in "Thumbnail", with: @island_collection.thumbnail
    fill_in "Title", with: @island_collection.title
    click_on "Create Island collection"

    assert_text "Island collection was successfully created"
    click_on "Back"
  end

  test "updating a Island collection" do
    visit island_collections_url
    click_on "Edit", match: :first

    fill_in "Thumbnail", with: @island_collection.thumbnail
    fill_in "Title", with: @island_collection.title
    click_on "Update Island collection"

    assert_text "Island collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Island collection" do
    visit island_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Island collection was successfully destroyed"
  end
end
