require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  # TODO create correct setup to run test
  def setup
    @screen = Screen.create(
      room_no: 1,
      capacity: 115
    )
    @movie = @screen.movies.create(
      screen_id: 1,
      title: 'Amaze balls',
      context: 'Something awesome here',
      showtime: '2017-09-16 11:25:00'
    )
  end

  test "should get new" do
    get new_screen_movie_path(@screen)
    assert_response :success
  end

  test "should get edit" do
    get edit_screen_movie_path(@screen, @movie)
    assert_response :success
  end

  test "should get show" do
    get screen_movie_url(@screen, @movie)
    assert_response :success
  end

end
