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
    assert_select 'li', 'Password is too short (minimum is 6 characters)'
    assert_select 'div.alert', 'The form contains 1 error.'
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      user = {
        name: 'Ai Hoshino',
        email: 'hoshino@bkomachi.ai',
        password: 'password',
        password_confirmation: 'password'
      }
      post users_path, params: { user: user }
    end

    assert_response :found # 302 Redirect
    follow_redirect!
    assert_template 'users/show'
    assert_select 'title', "Ai Hoshino | #{@app_name}"
  end
end
