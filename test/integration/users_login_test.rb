require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test 'unsuccessfully login with invalid credentials' do
    get login_path
    assert_template 'sessions/new'
    assert_select "title", "CineMix - Log in"
    post login_path, params: { session: {
      username: 'nottheone',
      password: '1234pass'
    } }
    assert_template 'sessions/new'
    assert_select "title", "CineMix - Log in"
    assert flash[:danger]
    get root_path
    assert_select "title", "CineMix - Home"
    assert flash.empty?
  end

  test 'successfully login with valid credentails' do
    get login_path
    assert_template 'sessions/new'
    assert_select "title", "CineMix - Log in"
    post login_path, params: { session: {
      username: @user.username,
      password: 'password'
    } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "title", "CineMix - #{@user.username}"
    # TODO assert links for login/logout and Screen/Movie create/updates
    # assert_select 'a[href=?]', login_path, count:0
    # assert_select 'a[href=?]', logout_path
    # assert_select 'a[href=?]', screens_path
  end

  test 'successfuly logout' do
    get login_path
    assert_template 'sessions/new'
    assert_select "title", "CineMix - Log in"
    post login_path, params: { session: {
      username: @user.username,
      password: 'password'
    } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "title", "CineMix - #{@user.username}"
    delete logout_path
    assert_redirected_to root_url
    follow_redirect!
    assert_select "title", "CineMix - Home"
  end
end
