require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'GET #index - renders properly' do
    get root_path

    assert_response 200
  end
end
