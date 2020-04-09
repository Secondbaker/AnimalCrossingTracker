require "application_system_test_case"

class PassportTitlesTest < ApplicationSystemTestCase
  setup do
    @passport_title = passport_titles(:one)
  end

  test "visiting the index" do
    visit passport_titles_url
    assert_selector "h1", text: "Passport Titles"
  end

  test "creating a Passport title" do
    visit passport_titles_url
    click_on "New Passport Title"

    fill_in "Value", with: @passport_title.value
    click_on "Create Passport title"

    assert_text "Passport title was successfully created"
    click_on "Back"
  end

  test "updating a Passport title" do
    visit passport_titles_url
    click_on "Edit", match: :first

    fill_in "Value", with: @passport_title.value
    click_on "Update Passport title"

    assert_text "Passport title was successfully updated"
    click_on "Back"
  end

  test "destroying a Passport title" do
    visit passport_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Passport title was successfully destroyed"
  end
end
