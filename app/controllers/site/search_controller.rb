class Site::SearchController < SiteController
  def index
    query = "%#{params[:q]}%"

    @results = {
      articles: Article.where('title ILIKE ? OR body ILIKE ?', query, query),
      books: Book.where('title ILIKE ? OR summary ILIKE ?', query, query),
      authors: Author.where('name ILIKE ? OR last_name ILIKE ? OR bio ILIKE ?', query, query, query),
      sermons: Sermon.where('title ILIKE ? OR description ILIKE ? OR category ILIKE ?', query, query, query)
    }
  end
end
