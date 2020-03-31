require 'test_helper'

class BirthdaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @birthday = birthdays(:one)
  end

  test "should get index" do
    get birthdays_url
    assert_response :success
  end

  test "should get new" do
    get new_birthday_url
    assert_response :success
  end

  test "should create birthday" do
    assert_difference('Birthday.count') do
      post birthdays_url, params: { birthday: { value: @birthday.value } }
    end

    assert_redirected_to birthday_url(Birthday.last)
  end

  test "should show birthday" do
    get birthday_url(@birthday)
    assert_response :success
  end

  test "should get edit" do
    get edit_birthday_url(@birthday)
    assert_response :success
  end

  test "should update birthday" do
    patch birthday_url(@birthday), params: { birthday: { value: @birthday.value } }
    assert_redirected_to birthday_url(@birthday)
  end

  test "should destroy birthday" do
    assert_difference('Birthday.count', -1) do
      delete birthday_url(@birthday)
    end

    assert_redirected_to birthdays_url
  end
end
