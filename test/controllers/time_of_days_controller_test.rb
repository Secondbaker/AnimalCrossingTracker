# frozen_string_literal: true

require 'test_helper'

class TimeOfDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_of_day = time_of_days(:one)
  end

  test 'should get index' do
    get time_of_days_url
    assert_response :success
  end

  test 'should get new' do
    get new_time_of_day_url
    assert_response :success
  end

  test 'should create time_of_day' do
    assert_difference('TimeOfDay.count') do
      post time_of_days_url, params: { time_of_day: { collectible_id: @time_of_day.collectible_id, end: @time_of_day.end, start: @time_of_day.start } }
    end

    assert_redirected_to time_of_day_url(TimeOfDay.last)
  end

  test 'should show time_of_day' do
    get time_of_day_url(@time_of_day)
    assert_response :success
  end

  test 'should get edit' do
    get edit_time_of_day_url(@time_of_day)
    assert_response :success
  end

  test 'should update time_of_day' do
    patch time_of_day_url(@time_of_day), params: { time_of_day: { collectible_id: @time_of_day.collectible_id, end: @time_of_day.end, start: @time_of_day.start } }
    assert_redirected_to time_of_day_url(@time_of_day)
  end

  test 'should destroy time_of_day' do
    assert_difference('TimeOfDay.count', -1) do
      delete time_of_day_url(@time_of_day)
    end

    assert_redirected_to time_of_days_url
  end
end
