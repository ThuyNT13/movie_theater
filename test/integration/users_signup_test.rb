require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'invalid signup' do
    get signup_path
    assert_no_difference('User.count') do
      post signup_path, params: { user: {
        username: '',
        email: 'non-user.com',
        password: 'not'
    } }
    end
    assert_template 'users/new'
    assert_select "title", "CineMix - Register"
    assert_select 'div#error_message'
    assert_select 'form[action=?]', '/signup'
  end

  test 'valid signup' do
    get signup_path
    assert_difference('User.count', 1) do
      post signup_path, params: { user: {
        username: 'thisname',
        email: 'user@email.com',
        password: 'password'
    } }
    end
    follow_redirect!
    assert flash[:success]
    assert_template 'users/show'
    assert is_logged_in?
    assert_select "title", "CineMix - thisname"
  end

end
