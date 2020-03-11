require "application_system_test_case"

class CollectiblesTest < ApplicationSystemTestCase
  setup do
    @collectible = collectibles(:one)
  end

  test "visiting the index" do
    visit collectibles_url
    assert_selector "h1", text: "Collectibles"
  end

  test "creating a Collectible" do
    visit collectibles_url
    click_on "New Collectible"

    fill_in "Collection", with: @collectible.collection_id
    click_on "Create Collectible"

    assert_text "Collectible was successfully created"
    click_on "Back"
  end

  test "updating a Collectible" do
    visit collectibles_url
    click_on "Edit", match: :first

    fill_in "Collection", with: @collectible.collection_id
    click_on "Update Collectible"

    assert_text "Collectible was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible" do
    visit collectibles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible was successfully destroyed"
  end
end
