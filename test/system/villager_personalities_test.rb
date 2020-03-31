require "application_system_test_case"

class VillagerPersonalitiesTest < ApplicationSystemTestCase
  setup do
    @villager_personality = villager_personalities(:one)
  end

  test "visiting the index" do
    visit villager_personalities_url
    assert_selector "h1", text: "Villager Personalities"
  end

  test "creating a Villager personality" do
    visit villager_personalities_url
    click_on "New Villager Personality"

    click_on "Create Villager personality"

    assert_text "Villager personality was successfully created"
    click_on "Back"
  end

  test "updating a Villager personality" do
    visit villager_personalities_url
    click_on "Edit", match: :first

    click_on "Update Villager personality"

    assert_text "Villager personality was successfully updated"
    click_on "Back"
  end

  test "destroying a Villager personality" do
    visit villager_personalities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Villager personality was successfully destroyed"
  end
end
