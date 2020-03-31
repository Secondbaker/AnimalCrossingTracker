require "application_system_test_case"

class VillagerGendersTest < ApplicationSystemTestCase
  setup do
    @villager_gender = villager_genders(:one)
  end

  test "visiting the index" do
    visit villager_genders_url
    assert_selector "h1", text: "Villager Genders"
  end

  test "creating a Villager gender" do
    visit villager_genders_url
    click_on "New Villager Gender"

    fill_in "Value", with: @villager_gender.value
    click_on "Create Villager gender"

    assert_text "Villager gender was successfully created"
    click_on "Back"
  end

  test "updating a Villager gender" do
    visit villager_genders_url
    click_on "Edit", match: :first

    fill_in "Value", with: @villager_gender.value
    click_on "Update Villager gender"

    assert_text "Villager gender was successfully updated"
    click_on "Back"
  end

  test "destroying a Villager gender" do
    visit villager_genders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Villager gender was successfully destroyed"
  end
end
