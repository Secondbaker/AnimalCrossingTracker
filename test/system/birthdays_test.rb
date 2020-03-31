require "application_system_test_case"

class BirthdaysTest < ApplicationSystemTestCase
  setup do
    @birthday = birthdays(:one)
  end

  test "visiting the index" do
    visit birthdays_url
    assert_selector "h1", text: "Birthdays"
  end

  test "creating a Birthday" do
    visit birthdays_url
    click_on "New Birthday"

    fill_in "Value", with: @birthday.value
    click_on "Create Birthday"

    assert_text "Birthday was successfully created"
    click_on "Back"
  end

  test "updating a Birthday" do
    visit birthdays_url
    click_on "Edit", match: :first

    fill_in "Value", with: @birthday.value
    click_on "Update Birthday"

    assert_text "Birthday was successfully updated"
    click_on "Back"
  end

  test "destroying a Birthday" do
    visit birthdays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Birthday was successfully destroyed"
  end
end
