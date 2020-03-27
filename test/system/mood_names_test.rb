require "application_system_test_case"

class MoodNamesTest < ApplicationSystemTestCase
  setup do
    @mood_name = mood_names(:one)
  end

  test "visiting the index" do
    visit mood_names_url
    assert_selector "h1", text: "Mood Names"
  end

  test "creating a Mood name" do
    visit mood_names_url
    click_on "New Mood Name"

    fill_in "String", with: @mood_name.string
    click_on "Create Mood name"

    assert_text "Mood name was successfully created"
    click_on "Back"
  end

  test "updating a Mood name" do
    visit mood_names_url
    click_on "Edit", match: :first

    fill_in "String", with: @mood_name.string
    click_on "Update Mood name"

    assert_text "Mood name was successfully updated"
    click_on "Back"
  end

  test "destroying a Mood name" do
    visit mood_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mood name was successfully destroyed"
  end
end
