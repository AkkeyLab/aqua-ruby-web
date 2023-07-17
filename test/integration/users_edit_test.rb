require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:akkey)
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    user = {
      name: '',
      email: 'a@a',
      password: 'a',
      password_confirmation: 'b'
    }
    patch user_path(@user), params: { user: user }
    assert_template 'users/edit'
    assert_select 'div.alert', 'The form contains 4 errors.'
  end

  test 'successful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    user = {
      name: 'Ai Hoshino',
      email: 'hoshino@bkomachi.ai',
      password: '',
      password_confirmation: ''
    }
    patch user_path(@user), params: { user: user }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal user[:name], @user.name
    assert_equal user[:email], @user.email
  end
end
