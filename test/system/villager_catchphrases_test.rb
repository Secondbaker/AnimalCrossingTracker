require "application_system_test_case"

class VillagerCatchphrasesTest < ApplicationSystemTestCase
  setup do
    @villager_catchphrase = villager_catchphrases(:one)
  end

  test "visiting the index" do
    visit villager_catchphrases_url
    assert_selector "h1", text: "Villager Catchphrases"
  end

  test "creating a Villager catchphrase" do
    visit villager_catchphrases_url
    click_on "New Villager Catchphrase"

    click_on "Create Villager catchphrase"

    assert_text "Villager catchphrase was successfully created"
    click_on "Back"
  end

  test "updating a Villager catchphrase" do
    visit villager_catchphrases_url
    click_on "Edit", match: :first

    click_on "Update Villager catchphrase"

    assert_text "Villager catchphrase was successfully updated"
    click_on "Back"
  end

  test "destroying a Villager catchphrase" do
    visit villager_catchphrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Villager catchphrase was successfully destroyed"
  end
end
