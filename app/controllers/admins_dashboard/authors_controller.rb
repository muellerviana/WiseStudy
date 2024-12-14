class AdminsDashboard::AuthorsController < AdminsDashboardController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to admins_dashboard_authors_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to admins_dashboard_authors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy
    redirect_to admins_dashboard_authors_path, status: :see_other
  end


  private 

  def author_params
    params.require(:author).permit(:name, :last_name, :bio, :birth_date, :death_date, :nationality, :author_avatar, :website)
  end
end
