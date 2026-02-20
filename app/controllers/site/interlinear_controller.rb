class Site::InterlinearController < SiteController
  def index
    @bible_books_grouped = BibleBook
      .order(:id)
      .group_by(&:testament)
      .transform_values { |books| books.map(&:name) }
  end

  def show
    book    = params[:book]
    chapter = params[:chapter]
    verse   = params[:verse]

    if chapter.blank?
      redirect_to root_path, alert: "Selecione um capítulo"
      return
    end

    if verse.present?
      # Retorna apenas um versículo
      @interlinear = Interlinear.where(chapter: chapter, verse: verse)
    else
      # Retorna todo o capítulo
      @interlinear = Interlinear.where(chapter: chapter).order(:verse)
    end
  end
end
