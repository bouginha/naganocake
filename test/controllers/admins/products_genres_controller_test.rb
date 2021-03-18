require 'test_helper'

class Admins::ProductsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_products_genres_new_url
    assert_response :success
  end

  test "should get show" do
    get admins_products_genres_show_url
    assert_response :success
  end

  test "should get index" do
    get admins_products_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_products_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_products_genres_update_url
    assert_response :success
  end

  test "should get create" do
    get admins_products_genres_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_products_genres_destroy_url
    assert_response :success
  end

end
