class ScreensController < ApplicationController
  before_action :set_screen, except: [:index, :new, :create]

  def index
    @screens = Screen.all
  end

  def show
  end

  def new
    @screen = Screen.new
  end

  def create
    @screen = Screen.new(screen_params)
    if @screen.save
      redirect_to @screen
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @screen.update(screen_params)
      redirect_to @screen
    else
      render 'edit'
    end
  end

  def destroy
    @screen.destroy
    redirect_to screens_path
  end

  private

  def set_screen
    @screen = Screen.find(params[:id])
  end

  def screen_params
    params.require(:screen).permit(:room_no, :capacity)
  end

end
