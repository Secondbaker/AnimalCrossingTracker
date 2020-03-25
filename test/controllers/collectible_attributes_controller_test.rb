# frozen_string_literal: true

require 'test_helper'

class CollectibleAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectible_attribute = collectible_attributes(:one)
  end

  test 'should get index' do
    get collectible_attributes_url
    assert_response :success
  end

  test 'should get new' do
    get new_collectible_attribute_url
    assert_response :success
  end

  test 'should create collectible_attribute' do
    assert_difference('CollectibleAttribute.count') do
      post collectible_attributes_url, params: { collectible_attribute: { collectible_id: @collectible_attribute.collectible_id, name: @collectible_attribute.name } }
    end

    assert_redirected_to collectible_attribute_url(CollectibleAttribute.last)
  end

  test 'should show collectible_attribute' do
    get collectible_attribute_url(@collectible_attribute)
    assert_response :success
  end

  test 'should get edit' do
    get edit_collectible_attribute_url(@collectible_attribute)
    assert_response :success
  end

  test 'should update collectible_attribute' do
    patch collectible_attribute_url(@collectible_attribute), params: { collectible_attribute: { collectible_id: @collectible_attribute.collectible_id, name: @collectible_attribute.name } }
    assert_redirected_to collectible_attribute_url(@collectible_attribute)
  end

  test 'should destroy collectible_attribute' do
    assert_difference('CollectibleAttribute.count', -1) do
      delete collectible_attribute_url(@collectible_attribute)
    end

    assert_redirected_to collectible_attributes_url
  end
end
