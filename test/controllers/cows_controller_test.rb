require 'test_helper'

class CowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cows_index_url
    assert_response :success
  end

end
