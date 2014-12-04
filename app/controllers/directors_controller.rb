class DirectorsController < ApplicationController
	#before_filter :authenticate_user!
  

  def index
    @directors = Director.all
  end

  def create
    @director = Director.create(director_params)
    redirect_to directors_path
  end
  

  def update
    @director = Director.find params[:id]
    @director.update_attributes!(director_params)
    redirect_to director_path(@director)
  end

  def edit
    @director = Director.find params[:id]
  end
  def show
    id = params[:id]
    @director = Director.find(id)
  end
  private
  def director_params
      params.require(:director).permit(:name)
  end
end
