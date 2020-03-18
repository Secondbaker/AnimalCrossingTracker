require "application_system_test_case"

class TimeOfDaysTest < ApplicationSystemTestCase
  setup do
    @time_of_day = time_of_days(:one)
  end

  test "visiting the index" do
    visit time_of_days_url
    assert_selector "h1", text: "Time Of Days"
  end

  test "creating a Time of day" do
    visit time_of_days_url
    click_on "New Time Of Day"

    fill_in "Collectible", with: @time_of_day.collectible_id
    fill_in "End", with: @time_of_day.end
    fill_in "Start", with: @time_of_day.start
    click_on "Create Time of day"

    assert_text "Time of day was successfully created"
    click_on "Back"
  end

  test "updating a Time of day" do
    visit time_of_days_url
    click_on "Edit", match: :first

    fill_in "Collectible", with: @time_of_day.collectible_id
    fill_in "End", with: @time_of_day.end
    fill_in "Start", with: @time_of_day.start
    click_on "Update Time of day"

    assert_text "Time of day was successfully updated"
    click_on "Back"
  end

  test "destroying a Time of day" do
    visit time_of_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time of day was successfully destroyed"
  end
end
