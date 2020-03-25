require "application_system_test_case"

class FishingSpotsTest < ApplicationSystemTestCase
  setup do
    @fishing_spot = fishing_spots(:one)
  end

  test "visiting the index" do
    visit fishing_spots_url
    assert_selector "h1", text: "Fishing Spots"
  end

  test "creating a Fishing spot" do
    visit fishing_spots_url
    click_on "New Fishing Spot"

    fill_in "Name", with: @fishing_spot.name
    click_on "Create Fishing spot"

    assert_text "Fishing spot was successfully created"
    click_on "Back"
  end

  test "updating a Fishing spot" do
    visit fishing_spots_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fishing_spot.name
    click_on "Update Fishing spot"

    assert_text "Fishing spot was successfully updated"
    click_on "Back"
  end

  test "destroying a Fishing spot" do
    visit fishing_spots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fishing spot was successfully destroyed"
  end
end
