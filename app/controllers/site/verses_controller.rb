class Site::VersesController < SiteController
  def show
    @verse = Verse.find(params[:id])
    @chapter = @verse.chapter
    @book = @chapter.bible_book
  end
end