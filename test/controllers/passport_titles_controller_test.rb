require 'test_helper'

class PassportTitlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passport_title = passport_titles(:one)
  end

  test "should get index" do
    get passport_titles_url
    assert_response :success
  end

  test "should get new" do
    get new_passport_title_url
    assert_response :success
  end

  test "should create passport_title" do
    assert_difference('PassportTitle.count') do
      post passport_titles_url, params: { passport_title: { value: @passport_title.value } }
    end

    assert_redirected_to passport_title_url(PassportTitle.last)
  end

  test "should show passport_title" do
    get passport_title_url(@passport_title)
    assert_response :success
  end

  test "should get edit" do
    get edit_passport_title_url(@passport_title)
    assert_response :success
  end

  test "should update passport_title" do
    patch passport_title_url(@passport_title), params: { passport_title: { value: @passport_title.value } }
    assert_redirected_to passport_title_url(@passport_title)
  end

  test "should destroy passport_title" do
    assert_difference('PassportTitle.count', -1) do
      delete passport_title_url(@passport_title)
    end

    assert_redirected_to passport_titles_url
  end
end
