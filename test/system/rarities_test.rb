# frozen_string_literal: true

require 'application_system_test_case'

class RaritiesTest < ApplicationSystemTestCase
  setup do
    @rarity = rarities(:one)
  end

  test 'visiting the index' do
    visit rarities_url
    assert_selector 'h1', text: 'Rarities'
  end

  test 'creating a Rarity' do
    visit rarities_url
    click_on 'New Rarity'

    fill_in 'Collectible', with: @rarity.collectible_id
    fill_in 'Value', with: @rarity.value
    click_on 'Create Rarity'

    assert_text 'Rarity was successfully created'
    click_on 'Back'
  end

  test 'updating a Rarity' do
    visit rarities_url
    click_on 'Edit', match: :first

    fill_in 'Collectible', with: @rarity.collectible_id
    fill_in 'Value', with: @rarity.value
    click_on 'Update Rarity'

    assert_text 'Rarity was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Rarity' do
    visit rarities_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Rarity was successfully destroyed'
  end
end
