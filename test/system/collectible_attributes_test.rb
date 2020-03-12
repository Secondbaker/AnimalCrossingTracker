require "application_system_test_case"

class CollectibleAttributesTest < ApplicationSystemTestCase
  setup do
    @collectible_attribute = collectible_attributes(:one)
  end

  test "visiting the index" do
    visit collectible_attributes_url
    assert_selector "h1", text: "Collectible Attributes"
  end

  test "creating a Collectible attribute" do
    visit collectible_attributes_url
    click_on "New Collectible Attribute"

    fill_in "Collectible", with: @collectible_attribute.collectible_id
    fill_in "Name", with: @collectible_attribute.name
    click_on "Create Collectible attribute"

    assert_text "Collectible attribute was successfully created"
    click_on "Back"
  end

  test "updating a Collectible attribute" do
    visit collectible_attributes_url
    click_on "Edit", match: :first

    fill_in "Collectible", with: @collectible_attribute.collectible_id
    fill_in "Name", with: @collectible_attribute.name
    click_on "Update Collectible attribute"

    assert_text "Collectible attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible attribute" do
    visit collectible_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible attribute was successfully destroyed"
  end
end
