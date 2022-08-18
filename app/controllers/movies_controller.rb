class MoviesController < ApplicationController
	before_action, :set_movie, :only[:edit, :update, :destroy, :show]

	def index
		@movies = Movie.all
	end

	def show
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(params_movie)
		if @movie.save
			redirect_to movie_path(@movie)
		else
			render :new, :status :see_ot
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def set_movie
		@movie = Movie.find(params[:id])
	end

	def params_movie
		params.require(:movie).permit(:title, :poster_url, :overview, :rating)
	end
end
