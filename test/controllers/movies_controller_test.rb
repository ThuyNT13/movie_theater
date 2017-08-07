require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @screen = screens(:one)
    @movie = @screen.movies.create(
      title: 'Amaze balls',
      context: 'Something awesome here',
      showtime: '2017-09-16 11:25:00'
    )
  end

  test "should get show" do
    get screen_movie_path(@screen, @movie)
    assert_response :success
    assert_select "title", "CineMix - #{@movie.title}"
  end

  test "should get new" do
    get new_screen_movie_path(@screen)
    assert_response :success
    assert_select "title", "CineMix - Add movie"
  end


  test "should create movie" do
    # TODO write test for movies#create
    # assert_difference('Movie.count') do
    #   post screen_movies_path, params: { screen: {
    #     room_no: @screen.room_no,
    #     capacity: @screen.capacity
    #   },
    #   movie: {
    #     title: @movie.title,
    #     context: @movie.context,
    #     showtime: @movie.showtime } }
    # end
    # assert_redirected_to screen_movie_url(@screen, Movie.last)
  end

  test "should get edit" do
    get edit_screen_movie_path(@screen, @movie)
    assert_response :success
    assert_select "title", "CineMix - Edit movie"
  end

  test "should update move" do
    # TODO write test for movies#update
  end

end
