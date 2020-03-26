require "application_system_test_case"

class ShadowSizesTest < ApplicationSystemTestCase
  setup do
    @shadow_size = shadow_sizes(:one)
  end

  test "visiting the index" do
    visit shadow_sizes_url
    assert_selector "h1", text: "Shadow Sizes"
  end

  test "creating a Shadow size" do
    visit shadow_sizes_url
    click_on "New Shadow Size"

    fill_in "Fishsize", with: @shadow_size.fishsize_id
    click_on "Create Shadow size"

    assert_text "Shadow size was successfully created"
    click_on "Back"
  end

  test "updating a Shadow size" do
    visit shadow_sizes_url
    click_on "Edit", match: :first

    fill_in "Fishsize", with: @shadow_size.fishsize_id
    click_on "Update Shadow size"

    assert_text "Shadow size was successfully updated"
    click_on "Back"
  end

  test "destroying a Shadow size" do
    visit shadow_sizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shadow size was successfully destroyed"
  end
end
