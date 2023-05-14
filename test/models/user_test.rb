require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'akkey', email: 'akkey@rails.rb')
  end

  test "should be valid" do
    assert @user.valid?
  end
end
