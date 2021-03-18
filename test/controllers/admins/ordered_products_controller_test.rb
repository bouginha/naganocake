require 'test_helper'

class Admins::OrderedProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_ordered_products_update_url
    assert_response :success
  end

end
