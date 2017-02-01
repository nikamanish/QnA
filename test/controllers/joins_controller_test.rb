require 'test_helper'

class JoinsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get joins_new_url
    assert_response :success
  end

end
