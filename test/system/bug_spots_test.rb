require "application_system_test_case"

class BugSpotsTest < ApplicationSystemTestCase
  setup do
    @bug_spot = bug_spots(:one)
  end

  test "visiting the index" do
    visit bug_spots_url
    assert_selector "h1", text: "Bug Spots"
  end

  test "creating a Bug spot" do
    visit bug_spots_url
    click_on "New Bug Spot"

    click_on "Create Bug spot"

    assert_text "Bug spot was successfully created"
    click_on "Back"
  end

  test "updating a Bug spot" do
    visit bug_spots_url
    click_on "Edit", match: :first

    click_on "Update Bug spot"

    assert_text "Bug spot was successfully updated"
    click_on "Back"
  end

  test "destroying a Bug spot" do
    visit bug_spots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bug spot was successfully destroyed"
  end
end
