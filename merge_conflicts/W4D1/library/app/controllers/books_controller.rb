class BooksController < ApplicationController
  def index
    # your code here
		@books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
		new_book = Book.new(book_params)
		unless new_book.save!
			render json: new_book.errors.full_messages, status: :unprocessable_entity
		end

		redirect_to books_url
  end

  def destroy
		Book.find(params[:id]).destroy

		redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
