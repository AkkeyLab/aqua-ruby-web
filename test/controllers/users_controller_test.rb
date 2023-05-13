require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = 'aqua.rb'
  end

  test 'should get new' do
    get signup_path
    assert_response :success
    assert_select 'title', "Sign Up | #{@app_name}"
  end
end
