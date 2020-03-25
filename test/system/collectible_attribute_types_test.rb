# frozen_string_literal: true

require 'application_system_test_case'

class CollectibleAttributeTypesTest < ApplicationSystemTestCase
  setup do
    @collectible_attribute_type = collectible_attribute_types(:one)
  end

  test 'visiting the index' do
    visit collectible_attribute_types_url
    assert_selector 'h1', text: 'Collectible Attribute Types'
  end

  test 'creating a Collectible attribute type' do
    visit collectible_attribute_types_url
    click_on 'New Collectible Attribute Type'

    fill_in 'Name', with: @collectible_attribute_type.name
    click_on 'Create Collectible attribute type'

    assert_text 'Collectible attribute type was successfully created'
    click_on 'Back'
  end

  test 'updating a Collectible attribute type' do
    visit collectible_attribute_types_url
    click_on 'Edit', match: :first

    fill_in 'Name', with: @collectible_attribute_type.name
    click_on 'Update Collectible attribute type'

    assert_text 'Collectible attribute type was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Collectible attribute type' do
    visit collectible_attribute_types_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Collectible attribute type was successfully destroyed'
  end
end
