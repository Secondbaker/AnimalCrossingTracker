require "application_system_test_case"

class StringCollectibleAttributesTest < ApplicationSystemTestCase
  setup do
    @string_collectible_attribute = string_collectible_attributes(:one)
  end

  test "visiting the index" do
    visit string_collectible_attributes_url
    assert_selector "h1", text: "String Collectible Attributes"
  end

  test "creating a String collectible attribute" do
    visit string_collectible_attributes_url
    click_on "New String Collectible Attribute"

    fill_in "Value", with: @string_collectible_attribute.value
    click_on "Create String collectible attribute"

    assert_text "String collectible attribute was successfully created"
    click_on "Back"
  end

  test "updating a String collectible attribute" do
    visit string_collectible_attributes_url
    click_on "Edit", match: :first

    fill_in "Value", with: @string_collectible_attribute.value
    click_on "Update String collectible attribute"

    assert_text "String collectible attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a String collectible attribute" do
    visit string_collectible_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "String collectible attribute was successfully destroyed"
  end
end
