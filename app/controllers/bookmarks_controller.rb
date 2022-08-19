class BookmarksController < ApplicationController

	def new
		@list = List.find(params[:list_id])
		@bookmark = Bookmark.new
	end

	def create
		@bookmark = Bookmark.create(set_bookmark)
		@list = List.find(params[:list_id])
		@bookmark.list = @list
		@bookmark.save
		redirect_to list_path(@list)
	end

	def destroy
		@bookmark = Bookmark.find(params[:id])
		@bookmark.destroy
		redirect_to list_path(@bookmark.list), status: :see_other 
	end

	private

	def set_bookmark
		params.require(:bookmark).permit(:comment, :movie_id)
	end
end
