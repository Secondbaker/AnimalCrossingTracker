# frozen_string_literal: true

require 'application_system_test_case'

class BugLocationsTest < ApplicationSystemTestCase
  setup do
    @bug_location = bug_locations(:one)
  end

  test 'visiting the index' do
    visit bug_locations_url
    assert_selector 'h1', text: 'Bug Locations'
  end

  test 'creating a Bug location' do
    visit bug_locations_url
    click_on 'New Bug Location'

    click_on 'Create Bug location'

    assert_text 'Bug location was successfully created'
    click_on 'Back'
  end

  test 'updating a Bug location' do
    visit bug_locations_url
    click_on 'Edit', match: :first

    click_on 'Update Bug location'

    assert_text 'Bug location was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Bug location' do
    visit bug_locations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Bug location was successfully destroyed'
  end
end
