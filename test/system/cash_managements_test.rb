require "application_system_test_case"

class CashManagementsTest < ApplicationSystemTestCase
  setup do
    @cash_management = cash_managements(:one)
  end

  test "visiting the index" do
    visit cash_managements_url
    assert_selector "h1", text: "Cash Managements"
  end

  test "creating a Cash management" do
    visit cash_managements_url
    click_on "New Cash Management"

    fill_in "Cash in", with: @cash_management.cash_in
    fill_in "Cash out", with: @cash_management.cash_out
    fill_in "Initial cash", with: @cash_management.initial_cash
    click_on "Create Cash management"

    assert_text "Cash management was successfully created"
    click_on "Back"
  end

  test "updating a Cash management" do
    visit cash_managements_url
    click_on "Edit", match: :first

    fill_in "Cash in", with: @cash_management.cash_in
    fill_in "Cash out", with: @cash_management.cash_out
    fill_in "Initial cash", with: @cash_management.initial_cash
    click_on "Update Cash management"

    assert_text "Cash management was successfully updated"
    click_on "Back"
  end

  test "destroying a Cash management" do
    visit cash_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cash management was successfully destroyed"
  end
end
