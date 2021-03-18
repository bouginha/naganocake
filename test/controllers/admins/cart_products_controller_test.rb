require 'test_helper'

class Admins::CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_cart_products_index_url
    assert_response :success
  end

  test "should get create" do
    get admins_cart_products_create_url
    assert_response :success
  end

  test "should get update" do
    get admins_cart_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_cart_products_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get admins_cart_products_all_destroy_url
    assert_response :success
  end

end
