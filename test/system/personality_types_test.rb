require "application_system_test_case"

class PersonalityTypesTest < ApplicationSystemTestCase
  setup do
    @personality_type = personality_types(:one)
  end

  test "visiting the index" do
    visit personality_types_url
    assert_selector "h1", text: "Personality Types"
  end

  test "creating a Personality type" do
    visit personality_types_url
    click_on "New Personality Type"

    fill_in "Value", with: @personality_type.value
    click_on "Create Personality type"

    assert_text "Personality type was successfully created"
    click_on "Back"
  end

  test "updating a Personality type" do
    visit personality_types_url
    click_on "Edit", match: :first

    fill_in "Value", with: @personality_type.value
    click_on "Update Personality type"

    assert_text "Personality type was successfully updated"
    click_on "Back"
  end

  test "destroying a Personality type" do
    visit personality_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personality type was successfully destroyed"
  end
end
