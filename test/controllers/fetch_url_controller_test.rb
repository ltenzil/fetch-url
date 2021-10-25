require "test_helper"

class FetchUrlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fetch_url_index_url
    assert_response :success
  end

  test "should get show" do
    get fetch_url_show_url
    assert_response :success
  end
end
