require "application_system_test_case"

class CollectibleAttributeListItemsTest < ApplicationSystemTestCase
  setup do
    @collectible_attribute_list_item = collectible_attribute_list_items(:one)
  end

  test "visiting the index" do
    visit collectible_attribute_list_items_url
    assert_selector "h1", text: "Collectible Attribute List Items"
  end

  test "creating a Collectible attribute list item" do
    visit collectible_attribute_list_items_url
    click_on "New Collectible Attribute List Item"

    fill_in "Collectible attribute list", with: @collectible_attribute_list_item.collectible_attribute_list_id
    fill_in "Position", with: @collectible_attribute_list_item.position
    click_on "Create Collectible attribute list item"

    assert_text "Collectible attribute list item was successfully created"
    click_on "Back"
  end

  test "updating a Collectible attribute list item" do
    visit collectible_attribute_list_items_url
    click_on "Edit", match: :first

    fill_in "Collectible attribute list", with: @collectible_attribute_list_item.collectible_attribute_list_id
    fill_in "Position", with: @collectible_attribute_list_item.position
    click_on "Update Collectible attribute list item"

    assert_text "Collectible attribute list item was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible attribute list item" do
    visit collectible_attribute_list_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible attribute list item was successfully destroyed"
  end
end
