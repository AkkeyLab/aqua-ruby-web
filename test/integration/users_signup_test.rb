require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = 'aqua.rb'
  end

  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      user = {
        name: 'Ai Hoshino',
        email: 'hoshino@bkomachi.ai',
        password: 'pass',
        password_confirmation: 'pass'
      }
      post users_path, params: { user: user }
    end

    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'title', "Sign Up | #{@app_name}"
  end
end
