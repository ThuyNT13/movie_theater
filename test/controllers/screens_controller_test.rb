require 'test_helper'

class ScreensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screen = screens(:one)
  end

  test "should get index" do
    get screens_path
    assert_response :success
  end

  test "should get show" do
    get screen_path(@screen)
    assert_response :success
  end

  test "should get new" do
    get new_screen_path
    assert_response :success
  end

  test "should create screen" do
    assert_difference('Screen.count') do
      post screens_path, params: { screen: {
        room_no: @screen.room_no, capacity: @screen.capacity }}
    end
    assert_redirected_to screen_path(Screen.last)
  end

  test "should get edit" do
    get edit_screen_path(@screen)
    assert_response :success
  end

  test "should update screen" do
    # TODO
  end

  test "should delete screen" do
    assert_difference('Screen.count', -1) do
      delete screen_path(@screen)
    end
    assert_redirected_to screens_path
  end

end
