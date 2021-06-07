require 'test_helper'

class IntegrationStoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @integration_store = integration_stores(:one)
  end

  test "should get index" do
    get integration_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_integration_store_url
    assert_response :success
  end

  test "should create integration_store" do
    assert_difference('IntegrationStore.count') do
      post integration_stores_url, params: { integration_store: { api_key: @integration_store.api_key, kind: @integration_store.kind, password: @integration_store.password, store_name: @integration_store.store_name, user_id: @integration_store.user_id } }
    end

    assert_redirected_to integration_store_url(IntegrationStore.last)
  end

  test "should show integration_store" do
    get integration_store_url(@integration_store)
    assert_response :success
  end

  test "should get edit" do
    get edit_integration_store_url(@integration_store)
    assert_response :success
  end

  test "should update integration_store" do
    patch integration_store_url(@integration_store), params: { integration_store: { api_key: @integration_store.api_key, kind: @integration_store.kind, password: @integration_store.password, store_name: @integration_store.store_name, user_id: @integration_store.user_id } }
    assert_redirected_to integration_store_url(@integration_store)
  end

  test "should destroy integration_store" do
    assert_difference('IntegrationStore.count', -1) do
      delete integration_store_url(@integration_store)
    end

    assert_redirected_to integration_stores_url
  end
end
