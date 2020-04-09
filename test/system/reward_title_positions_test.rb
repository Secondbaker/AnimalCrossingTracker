require "application_system_test_case"

class RewardTitlePositionsTest < ApplicationSystemTestCase
  setup do
    @reward_title_position = reward_title_positions(:one)
  end

  test "visiting the index" do
    visit reward_title_positions_url
    assert_selector "h1", text: "Reward Title Positions"
  end

  test "creating a Reward title position" do
    visit reward_title_positions_url
    click_on "New Reward Title Position"

    click_on "Create Reward title position"

    assert_text "Reward title position was successfully created"
    click_on "Back"
  end

  test "updating a Reward title position" do
    visit reward_title_positions_url
    click_on "Edit", match: :first

    click_on "Update Reward title position"

    assert_text "Reward title position was successfully updated"
    click_on "Back"
  end

  test "destroying a Reward title position" do
    visit reward_title_positions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reward title position was successfully destroyed"
  end
end
