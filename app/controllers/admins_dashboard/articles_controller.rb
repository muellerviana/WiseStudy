class AdminsDashboard::ArticlesController < AdminsDashboardController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admins_backoffice_articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
