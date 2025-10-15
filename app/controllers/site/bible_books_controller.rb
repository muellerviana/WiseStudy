class Site::BibleBooksController < SiteController
  def index
    @bible_books = BibleBook.all.order(:id) # or order by testament and number
  end

  def show
    @bible_book = BibleBook.find(params[:id])
    @chapters = @bible_book.chapters.order(:number)
  end
end
