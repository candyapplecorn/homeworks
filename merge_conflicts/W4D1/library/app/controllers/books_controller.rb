class BooksController < ApplicationController
  def index
    # your code here
<<<<<<< HEAD
=======
		@books = Book.all
>>>>>>> c48afca641f6aa246524919367f78f2d48df2b03
  end

  def new
    # your code here
  end

  def create
    # your code here
<<<<<<< HEAD
  end

  def destroy
    # your code here
=======
		new_book = Book.new(book_params)
		unless new_book.save!
			render json: new_book.errors.full_messages, status: :unprocessable_entity
		end

		redirect_to books_url
  end

  def destroy
		Book.find(params[:id]).destroy

		redirect_to books_url
>>>>>>> c48afca641f6aa246524919367f78f2d48df2b03
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
