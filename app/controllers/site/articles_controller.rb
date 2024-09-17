class Site::ArticlesController < SiteController

  def index
    @articles = Article.all
  end
end