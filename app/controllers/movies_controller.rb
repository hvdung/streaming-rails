class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update]
  
  def index
    @movies = Movie.all
  end

  def show; end

  def new
    @movie_form = MovieForm.new
  end

  def create
    @movie_form = MovieForm.new(params = movie_params)
    if @movie_form.save
      redirect_to movies_path, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def edit
    @movie_form = MovieForm.new(nil, @movie)
  end

  def update
    @movie_form = MovieForm.new(movie_params, @movie)
    if @movie_form.save
      redirect_to movies_path, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def delete; end

  private

  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie_form).permit(:title, :url, :file)
  end
end
