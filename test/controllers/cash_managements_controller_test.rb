require 'test_helper'

class CashManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_management = cash_managements(:one)
  end

  test "should get index" do
    get cash_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_management_url
    assert_response :success
  end

  test "should create cash_management" do
    assert_difference('CashManagement.count') do
      post cash_managements_url, params: { cash_management: { cash_in: @cash_management.cash_in, cash_out: @cash_management.cash_out, initial_cash: @cash_management.initial_cash } }
    end

    assert_redirected_to cash_management_url(CashManagement.last)
  end

  test "should show cash_management" do
    get cash_management_url(@cash_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_management_url(@cash_management)
    assert_response :success
  end

  test "should update cash_management" do
    patch cash_management_url(@cash_management), params: { cash_management: { cash_in: @cash_management.cash_in, cash_out: @cash_management.cash_out, initial_cash: @cash_management.initial_cash } }
    assert_redirected_to cash_management_url(@cash_management)
  end

  test "should destroy cash_management" do
    assert_difference('CashManagement.count', -1) do
      delete cash_management_url(@cash_management)
    end

    assert_redirected_to cash_managements_url
  end
end
