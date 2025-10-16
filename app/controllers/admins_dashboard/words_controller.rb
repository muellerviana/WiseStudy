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
      next_position = @word.position + 1
      next_word = @word.verse.words.find_by(position: next_position)
      if next_word
        redirect_to admins_dashboard_bible_book_chapter_verse_word_path(
          @word.verse.chapter.bible_book,
          @word.verse.chapter,
          @word.verse,
          next_word
        )
      else
        redirect_to admins_dashboard_bible_book_chapter_verse_word_path(
          @word.verse.chapter.bible_book,
          @word.verse.chapter,
          @word.verse,
          @word
        ), alert: "This is the last word in the verse."
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def word_params
    params.require(:word).permit(:translation, :transliteration)
  end
end
