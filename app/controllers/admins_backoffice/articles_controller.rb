class AdminsBackoffice::ArticlesController < AdminsBackofficeController
  def index
    @articles = Article.all
  end
end
