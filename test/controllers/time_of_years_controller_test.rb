# frozen_string_literal: true

require 'test_helper'

class TimeOfYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_of_year = time_of_years(:one)
  end

  test 'should get index' do
    get time_of_years_url
    assert_response :success
  end

  test 'should get new' do
    get new_time_of_year_url
    assert_response :success
  end

  test 'should create time_of_year' do
    assert_difference('TimeOfYear.count') do
      post time_of_years_url, params: { time_of_year: { months_id: @time_of_year.months_id } }
    end

    assert_redirected_to time_of_year_url(TimeOfYear.last)
  end

  test 'should show time_of_year' do
    get time_of_year_url(@time_of_year)
    assert_response :success
  end

  test 'should get edit' do
    get edit_time_of_year_url(@time_of_year)
    assert_response :success
  end

  test 'should update time_of_year' do
    patch time_of_year_url(@time_of_year), params: { time_of_year: { months_id: @time_of_year.months_id } }
    assert_redirected_to time_of_year_url(@time_of_year)
  end

  test 'should destroy time_of_year' do
    assert_difference('TimeOfYear.count', -1) do
      delete time_of_year_url(@time_of_year)
    end

    assert_redirected_to time_of_years_url
  end
end
