# frozen_string_literal: true

require 'application_system_test_case'

class BellValuesTest < ApplicationSystemTestCase
  setup do
    @bell_value = bell_values(:one)
  end

  test 'visiting the index' do
    visit bell_values_url
    assert_selector 'h1', text: 'Bell Values'
  end

  test 'creating a Bell value' do
    visit bell_values_url
    click_on 'New Bell Value'

    fill_in 'Collectible', with: @bell_value.collectible_id
    fill_in 'Value', with: @bell_value.value
    click_on 'Create Bell value'

    assert_text 'Bell value was successfully created'
    click_on 'Back'
  end

  test 'updating a Bell value' do
    visit bell_values_url
    click_on 'Edit', match: :first

    fill_in 'Collectible', with: @bell_value.collectible_id
    fill_in 'Value', with: @bell_value.value
    click_on 'Update Bell value'

    assert_text 'Bell value was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Bell value' do
    visit bell_values_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Bell value was successfully destroyed'
  end
end
