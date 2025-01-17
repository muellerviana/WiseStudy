class Site::SearchController < SiteController
  def index
    # Clean and validate the query
    query = params[:q].to_s.strip

    # Return empty results if the query is blank
    if query.blank?
      @results = {}
      return
    end

    # Perform searches only if the query is valid
    search_query = "%#{query}%"
    @results = {
      articles: Article.where('title ILIKE ? OR body ILIKE ?', search_query, search_query),
      books: Book.where('title ILIKE ? OR summary ILIKE ?', search_query, search_query),
      authors: Author.where('name ILIKE ? OR last_name ILIKE ? OR bio ILIKE ?', search_query, search_query, search_query),
      sermons: Sermon.where('title ILIKE ? OR description ILIKE ? OR category ILIKE ?', search_query, search_query, search_query)
    }.reject { |_key, value| value.empty? }

    @params = query
  end
end
