# frozen_string_literal: true

require 'test_helper'

class BugLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bug_location = bug_locations(:one)
  end

  test 'should get index' do
    get bug_locations_url
    assert_response :success
  end

  test 'should get new' do
    get new_bug_location_url
    assert_response :success
  end

  test 'should create bug_location' do
    assert_difference('BugLocation.count') do
      post bug_locations_url, params: { bug_location: {} }
    end

    assert_redirected_to bug_location_url(BugLocation.last)
  end

  test 'should show bug_location' do
    get bug_location_url(@bug_location)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bug_location_url(@bug_location)
    assert_response :success
  end

  test 'should update bug_location' do
    patch bug_location_url(@bug_location), params: { bug_location: {} }
    assert_redirected_to bug_location_url(@bug_location)
  end

  test 'should destroy bug_location' do
    assert_difference('BugLocation.count', -1) do
      delete bug_location_url(@bug_location)
    end

    assert_redirected_to bug_locations_url
  end
end
