require "test_helper"

class AlternativesControllerTest < ActionDispatch::IntegrationTest
  test "should get count" do
    get alternatives_count_url
    assert_response :success
  end
end
