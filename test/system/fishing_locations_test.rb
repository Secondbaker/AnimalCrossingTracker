require "application_system_test_case"

class FishingLocationsTest < ApplicationSystemTestCase
  setup do
    @fishing_location = fishing_locations(:one)
  end

  test "visiting the index" do
    visit fishing_locations_url
    assert_selector "h1", text: "Fishing Locations"
  end

  test "creating a Fishing location" do
    visit fishing_locations_url
    click_on "New Fishing Location"

    fill_in "Name", with: @fishing_location.name
    click_on "Create Fishing location"

    assert_text "Fishing location was successfully created"
    click_on "Back"
  end

  test "updating a Fishing location" do
    visit fishing_locations_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fishing_location.name
    click_on "Update Fishing location"

    assert_text "Fishing location was successfully updated"
    click_on "Back"
  end

  test "destroying a Fishing location" do
    visit fishing_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fishing location was successfully destroyed"
  end
end
