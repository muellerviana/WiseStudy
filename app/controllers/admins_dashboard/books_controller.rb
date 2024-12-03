class AdminsDashboard::BooksController < AdminsDashboardController
  def index
    @books = Book.all
  end

  def show
    @book = Book.includes(:authors).find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to admins_dashboard_books_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private 

  def book_params
    params.require(:book).permit(:title, :publisher, :publication_year, :isbn, :summary, :genre, :language)
  end
end
