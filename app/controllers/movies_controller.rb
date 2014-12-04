class MoviesController < ApplicationController
	#before_filter :authenticate_user!
  def new
    @director = Director.find(params[:director_id])
    @movie = @director.movies.build
  end
  
  def show
    
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def index
    @director = Director.find(params[:director_id])
    @movies = Movie.where(director_id: params[:director_id])
  end
  
  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    director = @movie.director
    redirect_to director_movies_path(director)
  end

  def create
     @director = Director.find(params[:director_id])
     @movie = @director.movies.create(movie_params)
     redirect_to director_movies_path
  end
  private 
  def movie_params
    params.require(:movie).permit(:title, :rating, :releasedyear)
  end
end
