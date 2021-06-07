require "application_system_test_case"

class IntegrationStoresTest < ApplicationSystemTestCase
  setup do
    @integration_store = integration_stores(:one)
  end

  test "visiting the index" do
    visit integration_stores_url
    assert_selector "h1", text: "Integration Stores"
  end

  test "creating a Integration store" do
    visit integration_stores_url
    click_on "New Integration Store"

    fill_in "Api key", with: @integration_store.api_key
    fill_in "Kind", with: @integration_store.kind
    fill_in "Password", with: @integration_store.password
    fill_in "Store name", with: @integration_store.store_name
    fill_in "User", with: @integration_store.user_id
    click_on "Create Integration store"

    assert_text "Integration store was successfully created"
    click_on "Back"
  end

  test "updating a Integration store" do
    visit integration_stores_url
    click_on "Edit", match: :first

    fill_in "Api key", with: @integration_store.api_key
    fill_in "Kind", with: @integration_store.kind
    fill_in "Password", with: @integration_store.password
    fill_in "Store name", with: @integration_store.store_name
    fill_in "User", with: @integration_store.user_id
    click_on "Update Integration store"

    assert_text "Integration store was successfully updated"
    click_on "Back"
  end

  test "destroying a Integration store" do
    visit integration_stores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Integration store was successfully destroyed"
  end
end
