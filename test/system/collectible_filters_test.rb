require "application_system_test_case"

class CollectibleFiltersTest < ApplicationSystemTestCase
  setup do
    @collectible_filter = collectible_filters(:one)
  end

  test "visiting the index" do
    visit collectible_filters_url
    assert_selector "h1", text: "Collectible Filters"
  end

  test "creating a Collectible filter" do
    visit collectible_filters_url
    click_on "New Collectible Filter"

    fill_in "Collectible attribute class name", with: @collectible_filter.collectible_attribute_class_name
    fill_in "Keyword", with: @collectible_filter.keyword
    fill_in "Name", with: @collectible_filter.name
    click_on "Create Collectible filter"

    assert_text "Collectible filter was successfully created"
    click_on "Back"
  end

  test "updating a Collectible filter" do
    visit collectible_filters_url
    click_on "Edit", match: :first

    fill_in "Collectible attribute class name", with: @collectible_filter.collectible_attribute_class_name
    fill_in "Keyword", with: @collectible_filter.keyword
    fill_in "Name", with: @collectible_filter.name
    click_on "Update Collectible filter"

    assert_text "Collectible filter was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible filter" do
    visit collectible_filters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible filter was successfully destroyed"
  end
end
