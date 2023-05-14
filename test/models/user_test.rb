require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'akkey', email: 'akkey@rails.rb')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'A' * 51
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "#{'A' * 247}@rails.rb"
    assert_not @user.valid?
  end
end
