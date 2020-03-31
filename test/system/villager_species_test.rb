require "application_system_test_case"

class VillagerSpeciesTest < ApplicationSystemTestCase
  setup do
    @villager_specy = villager_species(:one)
  end

  test "visiting the index" do
    visit villager_species_url
    assert_selector "h1", text: "Villager Species"
  end

  test "creating a Villager species" do
    visit villager_species_url
    click_on "New Villager Species"

    click_on "Create Villager species"

    assert_text "Villager species was successfully created"
    click_on "Back"
  end

  test "updating a Villager species" do
    visit villager_species_url
    click_on "Edit", match: :first

    click_on "Update Villager species"

    assert_text "Villager species was successfully updated"
    click_on "Back"
  end

  test "destroying a Villager species" do
    visit villager_species_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Villager species was successfully destroyed"
  end
end
