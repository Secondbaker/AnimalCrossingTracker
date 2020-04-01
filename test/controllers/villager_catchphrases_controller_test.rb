require 'test_helper'

class VillagerCatchphrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @villager_catchphrase = villager_catchphrases(:one)
  end

  test "should get index" do
    get villager_catchphrases_url
    assert_response :success
  end

  test "should get new" do
    get new_villager_catchphrase_url
    assert_response :success
  end

  test "should create villager_catchphrase" do
    assert_difference('VillagerCatchphrase.count') do
      post villager_catchphrases_url, params: { villager_catchphrase: {  } }
    end

    assert_redirected_to villager_catchphrase_url(VillagerCatchphrase.last)
  end

  test "should show villager_catchphrase" do
    get villager_catchphrase_url(@villager_catchphrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_villager_catchphrase_url(@villager_catchphrase)
    assert_response :success
  end

  test "should update villager_catchphrase" do
    patch villager_catchphrase_url(@villager_catchphrase), params: { villager_catchphrase: {  } }
    assert_redirected_to villager_catchphrase_url(@villager_catchphrase)
  end

  test "should destroy villager_catchphrase" do
    assert_difference('VillagerCatchphrase.count', -1) do
      delete villager_catchphrase_url(@villager_catchphrase)
    end

    assert_redirected_to villager_catchphrases_url
  end
end
