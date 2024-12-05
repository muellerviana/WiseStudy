class AdminsDashboard::BooksController < AdminsDashboardController
  def index
    @books = Book.all
  end

  def show
    @book = Book.includes(:authors).find(params[:id])
  end

  def new
    @book = Book.new
    @book.authors.build
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to admins_dashboard_books_path
    else
      render :new, status: :unprocessable_entity
    end
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

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to admins_dashboard_books_path, status: :see_other
  end


  private 

  def book_params
    params.require(:book).permit(:title, :publisher, :publication_year, :isbn, :summary, :genre, :language, 
                                  authors_attributes: [:id, :name, :last_name, :birth_date, :_destroy])
  end
end
