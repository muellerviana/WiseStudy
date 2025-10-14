class AdminsDashboard::BibleBooksController < AdminsDashboardController
  def index
    @bible_books = BibleBook.all
  end

  def show
    @bible_book = BibleBook.find(params[:id])
    @chapters = Chapter.all
  end
end
