require "application_system_test_case"

class CollectibleAttributeListsTest < ApplicationSystemTestCase
  setup do
    @collectible_attribute_list = collectible_attribute_lists(:one)
  end

  test "visiting the index" do
    visit collectible_attribute_lists_url
    assert_selector "h1", text: "Collectible Attribute Lists"
  end

  test "creating a Collectible attribute list" do
    visit collectible_attribute_lists_url
    click_on "New Collectible Attribute List"

    click_on "Create Collectible attribute list"

    assert_text "Collectible attribute list was successfully created"
    click_on "Back"
  end

  test "updating a Collectible attribute list" do
    visit collectible_attribute_lists_url
    click_on "Edit", match: :first

    click_on "Update Collectible attribute list"

    assert_text "Collectible attribute list was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible attribute list" do
    visit collectible_attribute_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible attribute list was successfully destroyed"
  end
end
