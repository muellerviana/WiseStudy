class Site::BooksController < SiteController
  def index
    @books = Book.all
  end
end
