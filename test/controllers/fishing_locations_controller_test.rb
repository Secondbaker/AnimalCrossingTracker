# frozen_string_literal: true

require 'test_helper'

class FishingLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishing_location = fishing_locations(:one)
  end

  test 'should get index' do
    get fishing_locations_url
    assert_response :success
  end

  test 'should get new' do
    get new_fishing_location_url
    assert_response :success
  end

  test 'should create fishing_location' do
    assert_difference('FishingLocation.count') do
      post fishing_locations_url, params: { fishing_location: { name: @fishing_location.name } }
    end

    assert_redirected_to fishing_location_url(FishingLocation.last)
  end

  test 'should show fishing_location' do
    get fishing_location_url(@fishing_location)
    assert_response :success
  end

  test 'should get edit' do
    get edit_fishing_location_url(@fishing_location)
    assert_response :success
  end

  test 'should update fishing_location' do
    patch fishing_location_url(@fishing_location), params: { fishing_location: { name: @fishing_location.name } }
    assert_redirected_to fishing_location_url(@fishing_location)
  end

  test 'should destroy fishing_location' do
    assert_difference('FishingLocation.count', -1) do
      delete fishing_location_url(@fishing_location)
    end

    assert_redirected_to fishing_locations_url
  end
end
