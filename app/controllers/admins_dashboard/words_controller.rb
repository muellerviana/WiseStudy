class AdminsDashboard::WordsController < AdminsDashboardController
  def show
    @word = Word.find(params[:id])
    @verse = @word.verse
    @chapter = @verse.chapter
    @book = @chapter.bible_book
  end

  def edit
    @word = Word.find(params[:id])
  end

   def update
    @word = Word.find(params[:id])

    if @word.update(word_params)
      redirect_to admins_dashboard_bible_book_chapter_verse_word_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def word_params
    params.require(:word).permit(:translation, :transliteration)
  end
end
