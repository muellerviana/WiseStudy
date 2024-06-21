class AdminsDashboard::ArticlesController < AdminsDashboardController
  def index
    @articles = Article.all
  end
end
