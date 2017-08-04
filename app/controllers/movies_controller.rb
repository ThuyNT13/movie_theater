class MoviesController < ApplicationController
  before_action :set_screen_movie
  before_action :set_movie, except: [:index, :new, :create]

  def index
    @movies = Movie.all # necessary?
  end

  def show
  end

  def new
    @movie = @screen.movies.new
  end

  def create
    @movie = @screen.movies.new(movie_params)

    if @movie.save
      redirect_to screen_movie_url(@screen, @movie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to screen_movie_url(@screen, @movie)
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to @screen
  end

  private

  def set_screen_movie
    @screen = Screen.find(params[:screen_id])
  end

  def set_movie
    @movie = @screen.movies.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :context, :showtime)
  end

end
