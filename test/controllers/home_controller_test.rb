require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "redirects anonymous users to login" do
    get root_path
    assert_redirected_to login_path
  end
end
