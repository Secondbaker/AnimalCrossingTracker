require 'test_helper'

class VillagerGendersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @villager_gender = villager_genders(:one)
  end

  test "should get index" do
    get villager_genders_url
    assert_response :success
  end

  test "should get new" do
    get new_villager_gender_url
    assert_response :success
  end

  test "should create villager_gender" do
    assert_difference('VillagerGender.count') do
      post villager_genders_url, params: { villager_gender: { value: @villager_gender.value } }
    end

    assert_redirected_to villager_gender_url(VillagerGender.last)
  end

  test "should show villager_gender" do
    get villager_gender_url(@villager_gender)
    assert_response :success
  end

  test "should get edit" do
    get edit_villager_gender_url(@villager_gender)
    assert_response :success
  end

  test "should update villager_gender" do
    patch villager_gender_url(@villager_gender), params: { villager_gender: { value: @villager_gender.value } }
    assert_redirected_to villager_gender_url(@villager_gender)
  end

  test "should destroy villager_gender" do
    assert_difference('VillagerGender.count', -1) do
      delete villager_gender_url(@villager_gender)
    end

    assert_redirected_to villager_genders_url
  end
end
