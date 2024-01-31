class AdminsBackoffice::DashboardController < AdminsBackofficeController
  def index
    @articles = Article.all
    @article_count = Article.count
  end
end
