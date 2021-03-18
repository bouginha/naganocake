require 'test_helper'

class OrderedProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get ordered_products_update_url
    assert_response :success
  end

end
