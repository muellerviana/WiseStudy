class AdminsDashboard::BooksController < AdminsDashboardController
  def index
    @books = Book.all
  end

  def show
    @book = Book.includes(:authors).find(params[:id])
  end
end
