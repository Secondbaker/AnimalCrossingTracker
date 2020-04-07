require "application_system_test_case"

class MilestoneValuesTest < ApplicationSystemTestCase
  setup do
    @milestone_value = milestone_values(:one)
  end

  test "visiting the index" do
    visit milestone_values_url
    assert_selector "h1", text: "Milestone Values"
  end

  test "creating a Milestone value" do
    visit milestone_values_url
    click_on "New Milestone Value"

    fill_in "Milestone", with: @milestone_value.milestone_id
    click_on "Create Milestone value"

    assert_text "Milestone value was successfully created"
    click_on "Back"
  end

  test "updating a Milestone value" do
    visit milestone_values_url
    click_on "Edit", match: :first

    fill_in "Milestone", with: @milestone_value.milestone_id
    click_on "Update Milestone value"

    assert_text "Milestone value was successfully updated"
    click_on "Back"
  end

  test "destroying a Milestone value" do
    visit milestone_values_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Milestone value was successfully destroyed"
  end
end
