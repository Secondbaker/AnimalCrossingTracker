require 'test_helper'

class CatchphrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catchphrase = catchphrases(:one)
  end

  test "should get index" do
    get catchphrases_url
    assert_response :success
  end

  test "should get new" do
    get new_catchphrase_url
    assert_response :success
  end

  test "should create catchphrase" do
    assert_difference('Catchphrase.count') do
      post catchphrases_url, params: { catchphrase: { name: @catchphrase.name } }
    end

    assert_redirected_to catchphrase_url(Catchphrase.last)
  end

  test "should show catchphrase" do
    get catchphrase_url(@catchphrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_catchphrase_url(@catchphrase)
    assert_response :success
  end

  test "should update catchphrase" do
    patch catchphrase_url(@catchphrase), params: { catchphrase: { name: @catchphrase.name } }
    assert_redirected_to catchphrase_url(@catchphrase)
  end

  test "should destroy catchphrase" do
    assert_difference('Catchphrase.count', -1) do
      delete catchphrase_url(@catchphrase)
    end

    assert_redirected_to catchphrases_url
  end
end
