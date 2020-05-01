require "application_system_test_case"

class CollectibleSortsTest < ApplicationSystemTestCase
  setup do
    @collectible_sort = collectible_sorts(:one)
  end

  test "visiting the index" do
    visit collectible_sorts_url
    assert_selector "h1", text: "Collectible Sorts"
  end

  test "creating a Collectible sort" do
    visit collectible_sorts_url
    click_on "New Collectible Sort"

    fill_in "Collectible attribute class name", with: @collectible_sort.collectible_attribute_class_name
    fill_in "Keyword", with: @collectible_sort.keyword
    fill_in "Name", with: @collectible_sort.name
    click_on "Create Collectible sort"

    assert_text "Collectible sort was successfully created"
    click_on "Back"
  end

  test "updating a Collectible sort" do
    visit collectible_sorts_url
    click_on "Edit", match: :first

    fill_in "Collectible attribute class name", with: @collectible_sort.collectible_attribute_class_name
    fill_in "Keyword", with: @collectible_sort.keyword
    fill_in "Name", with: @collectible_sort.name
    click_on "Update Collectible sort"

    assert_text "Collectible sort was successfully updated"
    click_on "Back"
  end

  test "destroying a Collectible sort" do
    visit collectible_sorts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collectible sort was successfully destroyed"
  end
end
