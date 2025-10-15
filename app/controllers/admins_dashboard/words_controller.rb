class AdminsDashboard::WordsController < AdminsDashboardController
  def show
    @word = Word.find(params[:id])
    @verse = @word.verse
    @chapter = @verse.chapter
    @book = @chapter.bible_book
  end

end
