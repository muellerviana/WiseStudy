class Site::ChaptersController < SiteController
  def show
    @chapter = Chapter.find(params[:id])
    @verses = @chapter.verses.order(:number)
    @bible_book = @chapter.bible_book
  end
end
