require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:akkey)
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    param = { name: '', email: '', password: '', password_confirmation: '' }
    patch user_path(@user), params: { user: param }
    assert_template 'users/edit'
  end
end
