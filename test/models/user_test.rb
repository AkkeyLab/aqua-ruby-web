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

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[
      akkey@rails.rb
      AKKEY@rails.RB
      A-K_KEY@rails.co.rb
      akkey.lab@rails.jp
      akkey+lab@rails.ai
    ]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject valid addresses' do
    invalid_addresses = %w[
      akkey@rails,rb
      AKKEYrails.RB
      A-K_KEY@rails.co.
      akkey.lab@ruby_on_rails.jp
      akkey+lab@rails+.ai
      akkey@rails..rb
    ]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
