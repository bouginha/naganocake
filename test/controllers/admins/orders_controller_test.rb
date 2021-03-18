require 'test_helper'

class Admins::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_orders_show_url
    assert_response :success
  end

  test "should get confirm" do
    get admins_orders_confirm_url
    assert_response :success
  end

  test "should get create" do
    get admins_orders_create_url
    assert_response :success
  end

  test "should get new" do
    get admins_orders_new_url
    assert_response :success
  end

  test "should get thanks" do
    get admins_orders_thanks_url
    assert_response :success
  end

end
