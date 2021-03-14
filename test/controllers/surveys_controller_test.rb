require "test_helper"

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get surveys_new_url
    assert_response :success
  end

  test "should get show" do
    get surveys_show_url
    assert_response :success
  end

  test "should get index" do
    get surveys_index_url
    assert_response :success
  end
end
