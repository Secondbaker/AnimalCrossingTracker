require "application_system_test_case"

class FishSizesTest < ApplicationSystemTestCase
  setup do
    @fish_size = fish_sizes(:one)
  end

  test "visiting the index" do
    visit fish_sizes_url
    assert_selector "h1", text: "Fish Sizes"
  end

  test "creating a Fish size" do
    visit fish_sizes_url
    click_on "New Fish Size"

    fill_in "Name", with: @fish_size.name
    click_on "Create Fish size"

    assert_text "Fish size was successfully created"
    click_on "Back"
  end

  test "updating a Fish size" do
    visit fish_sizes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fish_size.name
    click_on "Update Fish size"

    assert_text "Fish size was successfully updated"
    click_on "Back"
  end

  test "destroying a Fish size" do
    visit fish_sizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fish size was successfully destroyed"
  end
end
