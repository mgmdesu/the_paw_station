require "test_helper"

class Public::WalksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_walks_new_url
    assert_response :success
  end

  test "should get index" do
    get public_walks_index_url
    assert_response :success
  end

  test "should get show" do
    get public_walks_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_walks_edit_url
    assert_response :success
  end
end
