require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
    username: 'user13',
    email: 'user13@email.com',
    password: 'password' )
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = ' ' * 6
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should be present' do
    @user.password = ' ' * 6
    assert_not @user.valid?
  end

  test 'username should be at least 6 characters long' do
    @user.email = 'z' * 5
    assert_not @user.valid?
  end

  test 'password should be at least 6 characters long' do
    @user.password = 'z' * 5
    assert_not @user.valid?
  end

  test 'username shoudld be unique' do
    dup_user = @user.dup
    dup_user.username = @user.username.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test 'email should be unique' do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test 'username should be saved in lower-case' do
    mixed_cs = 'GoOpIest'
    @user.username = mixed_cs
    @user.save
    assert_equal @user.username, mixed_cs.downcase
  end

  test "should accept valid email addresses" do
    valid_addresses = %w[user@email.com USER1@email.here.com 1234_User@this.net last.first@baz.jp here+there@beatles.uk]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "should reject invalid email addresses" do
    invalid_addressses = %w[comma@email,com not_at_book.net dash@-example.com underscore@fizz_buzz.com ampersand@amper+sand.com tooMany@dots..com]
    invalid_addressses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
