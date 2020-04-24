require "application_system_test_case"

class NumberCollectibleAttributesTest < ApplicationSystemTestCase
  setup do
    @number_collectible_attribute = number_collectible_attributes(:one)
  end

  test "visiting the index" do
    visit number_collectible_attributes_url
    assert_selector "h1", text: "Number Collectible Attributes"
  end

  test "creating a Number collectible attribute" do
    visit number_collectible_attributes_url
    click_on "New Number Collectible Attribute"

    fill_in "Value", with: @number_collectible_attribute.value
    click_on "Create Number collectible attribute"

    assert_text "Number collectible attribute was successfully created"
    click_on "Back"
  end

  test "updating a Number collectible attribute" do
    visit number_collectible_attributes_url
    click_on "Edit", match: :first

    fill_in "Value", with: @number_collectible_attribute.value
    click_on "Update Number collectible attribute"

    assert_text "Number collectible attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Number collectible attribute" do
    visit number_collectible_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Number collectible attribute was successfully destroyed"
  end
end
