require 'test_helper'

class ChaoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chao_index_url
    assert_response :success
  end

end
