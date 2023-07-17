require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:akkey)
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    param = { name: '', email: 'a@a', password: 'a', password_confirmation: 'b' }
    patch user_path(@user), params: { user: param }
    assert_template 'users/edit'
    assert_select 'div.alert', 'The form contains 4 errors.'
  end
end
