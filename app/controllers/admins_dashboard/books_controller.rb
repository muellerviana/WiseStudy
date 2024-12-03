class AdminsDashboard::BooksController < AdminsDashboardController
  def index
    @books = Book.all
  end
end
