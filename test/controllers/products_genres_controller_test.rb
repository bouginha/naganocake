require 'test_helper'

class ProductsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get products_genres_show_url
    assert_response :success
  end

  test "should get index" do
    get products_genres_index_url
    assert_response :success
  end

end
