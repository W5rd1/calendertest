require 'test_helper'

class CalenderControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get calender_show_url
    assert_response :success
  end

end
