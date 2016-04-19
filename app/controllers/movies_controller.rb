class MoviesController < ApplicationController
  include MoviesHelper
  def index
    dude
    @movies = Movie.all
    @trending = Movie.trending
    @featured = Movie.featured
    rando = random_genre
    @genre = rando
    @random_genre1 = Movie.categorize(rando)
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def show_by_genre
    @genre = params["genre"].capitalize
    @movies = Movie.categorize(@genre)
  end

  def create
    add_one_movie(params["imdb_id"])
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end

end
