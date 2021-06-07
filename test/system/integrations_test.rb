require "application_system_test_case"

class IntegrationsTest < ApplicationSystemTestCase
  setup do
    @integration = integrations(:one)
  end

  test "visiting the index" do
    visit integrations_url
    assert_selector "h1", text: "Integrations"
  end

  test "creating a Integration" do
    visit integrations_url
    click_on "New Integration"

    fill_in "Api key", with: @integration.api_key
    fill_in "Password", with: @integration.password
    fill_in "Store name", with: @integration.store_name
    fill_in "Type", with: @integration.type
    fill_in "User", with: @integration.user_id
    click_on "Create Integration"

    assert_text "Integration was successfully created"
    click_on "Back"
  end

  test "updating a Integration" do
    visit integrations_url
    click_on "Edit", match: :first

    fill_in "Api key", with: @integration.api_key
    fill_in "Password", with: @integration.password
    fill_in "Store name", with: @integration.store_name
    fill_in "Type", with: @integration.type
    fill_in "User", with: @integration.user_id
    click_on "Update Integration"

    assert_text "Integration was successfully updated"
    click_on "Back"
  end

  test "destroying a Integration" do
    visit integrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Integration was successfully destroyed"
  end
end
