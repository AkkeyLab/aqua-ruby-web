require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'akkey',
      email: 'akkey@rails.rb',
      password: 'password',
      password_confirmation: 'password'
    )
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

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be saved as lowercase' do
    mixed_case_email = 'AKKEY@rails.RB'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' '
    assert_not @user.valid?
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'A' * 5
    assert_not @user.valid?
    @user.password = @user.password_confirmation = 'A' * 6
    assert @user.valid?
  end

  test 'remember' do
    assert_nil @user.remember_token
    assert_nil @user.remember_digest
    @user.remember
    assert @user.remember_token
    assert @user.remember_digest
    assert @user.remember_token != @user.remember_digest
  end
end
