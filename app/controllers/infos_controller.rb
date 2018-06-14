class InfosController < ApplicationController
	before_action :find_info, only: [:create, :destroy, :new]
	
	def create
		@info = @book.infos.create(params[:info].permit(:title, :content))
		respond_to do |format|
			format.html
			format.js
		end


		# redirect_to book_path(@book)
	end

	def destroy
		@info = @book.infos.find(params[:id])
		@info.destroy
		redirect_to book_path(@book)
	end

	def new
	end

	private
	def find_info
		@book = Book.find(params[:book_id])
	end
end
