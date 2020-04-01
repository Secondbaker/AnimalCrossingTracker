require "application_system_test_case"

class CatchphrasesTest < ApplicationSystemTestCase
  setup do
    @catchphrase = catchphrases(:one)
  end

  test "visiting the index" do
    visit catchphrases_url
    assert_selector "h1", text: "Catchphrases"
  end

  test "creating a Catchphrase" do
    visit catchphrases_url
    click_on "New Catchphrase"

    fill_in "Name", with: @catchphrase.name
    click_on "Create Catchphrase"

    assert_text "Catchphrase was successfully created"
    click_on "Back"
  end

  test "updating a Catchphrase" do
    visit catchphrases_url
    click_on "Edit", match: :first

    fill_in "Name", with: @catchphrase.name
    click_on "Update Catchphrase"

    assert_text "Catchphrase was successfully updated"
    click_on "Back"
  end

  test "destroying a Catchphrase" do
    visit catchphrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Catchphrase was successfully destroyed"
  end
end
