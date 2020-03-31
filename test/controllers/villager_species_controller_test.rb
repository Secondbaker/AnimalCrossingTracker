require 'test_helper'

class VillagerSpeciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @villager_specy = villager_species(:one)
  end

  test "should get index" do
    get villager_species_index_url
    assert_response :success
  end

  test "should get new" do
    get new_villager_specy_url
    assert_response :success
  end

  test "should create villager_specy" do
    assert_difference('VillagerSpecies.count') do
      post villager_species_index_url, params: { villager_specy: {  } }
    end

    assert_redirected_to villager_specy_url(VillagerSpecies.last)
  end

  test "should show villager_specy" do
    get villager_specy_url(@villager_specy)
    assert_response :success
  end

  test "should get edit" do
    get edit_villager_specy_url(@villager_specy)
    assert_response :success
  end

  test "should update villager_specy" do
    patch villager_specy_url(@villager_specy), params: { villager_specy: {  } }
    assert_redirected_to villager_specy_url(@villager_specy)
  end

  test "should destroy villager_specy" do
    assert_difference('VillagerSpecies.count', -1) do
      delete villager_specy_url(@villager_specy)
    end

    assert_redirected_to villager_species_index_url
  end
end
