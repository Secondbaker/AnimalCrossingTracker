require "application_system_test_case"

class TimeOfYearsTest < ApplicationSystemTestCase
  setup do
    @time_of_year = time_of_years(:one)
  end

  test "visiting the index" do
    visit time_of_years_url
    assert_selector "h1", text: "Time Of Years"
  end

  test "creating a Time of year" do
    visit time_of_years_url
    click_on "New Time Of Year"

    fill_in "Months", with: @time_of_year.months_id
    click_on "Create Time of year"

    assert_text "Time of year was successfully created"
    click_on "Back"
  end

  test "updating a Time of year" do
    visit time_of_years_url
    click_on "Edit", match: :first

    fill_in "Months", with: @time_of_year.months_id
    click_on "Update Time of year"

    assert_text "Time of year was successfully updated"
    click_on "Back"
  end

  test "destroying a Time of year" do
    visit time_of_years_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time of year was successfully destroyed"
  end
end
