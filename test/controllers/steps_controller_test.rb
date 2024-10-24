require "test_helper"

class StepsControllerTest < ActionDispatch::IntegrationTest
  test "should get how_it_works" do
    get steps_how_it_works_url
    assert_response :success
  end
end
