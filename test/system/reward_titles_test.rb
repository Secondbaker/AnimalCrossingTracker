require "application_system_test_case"

class RewardTitlesTest < ApplicationSystemTestCase
  setup do
    @reward_title = reward_titles(:one)
  end

  test "visiting the index" do
    visit reward_titles_url
    assert_selector "h1", text: "Reward Titles"
  end

  test "creating a Reward title" do
    visit reward_titles_url
    click_on "New Reward Title"

    click_on "Create Reward title"

    assert_text "Reward title was successfully created"
    click_on "Back"
  end

  test "updating a Reward title" do
    visit reward_titles_url
    click_on "Edit", match: :first

    click_on "Update Reward title"

    assert_text "Reward title was successfully updated"
    click_on "Back"
  end

  test "destroying a Reward title" do
    visit reward_titles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reward title was successfully destroyed"
  end
end
