class Site::BibleBooksController < SiteController
  def index
    @bible_books = BibleBook.all.order(:id) # or order by testament and number
  end

  def show
    @bible_book = BibleBook.find(params[:id])
    @chapters = @bible_book.chapters.order(:number)
  end

  def chapters
    book_name = params[:book_name]
    book = BibleBook.find_by(name: book_name)
    
    if book
      @chapters = book.chapters.order(:number)
      render partial: 'chapters', locals: { chapters: @chapters }
    else
      render plain: '<option>No chapters found</option>'
    end
  end

  def verses
    book_name = params[:book_name]
    chapter_number = params[:chapter_id]
    
    book = BibleBook.find_by(name: book_name)
    chapter = book.chapters.find_by(number: chapter_number) if book
    
    if chapter
      @verses = chapter.verses.order(:number)
      render partial: 'verses', locals: { verses: @verses }
    else
      render plain: '<option>No verses found</option>'
    end
  end
end
