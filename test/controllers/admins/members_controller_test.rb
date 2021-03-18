require 'test_helper'

class Admins::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_members_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_members_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get admins_members_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get admins_members_withdraw_url
    assert_response :success
  end

end
