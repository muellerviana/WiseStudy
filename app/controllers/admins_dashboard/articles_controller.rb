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
      redirect_to admins_dashboard_articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to admins_dashboard_articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to admins_dashboard_articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body, :article_cover)
  end
end
