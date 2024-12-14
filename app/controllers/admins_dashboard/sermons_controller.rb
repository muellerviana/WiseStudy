class AdminsDashboard::SermonsController < AdminsDashboardController
  def index
    @sermons = Sermon.all
  end

  def show
    @sermon = Sermon.find(params[:id])
  end

  def new
    @sermon = Sermon.new
  end

  def create
    @sermon = Sermon.new(sermon_params)

    if @sermon.save
      redirect_to admins_dashboard_sermons_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @sermon = Sermon.find(params[:id])
  end

  def update
    @sermon = Sermon.find(params[:id])

    if @sermon.update(sermon_params)
      redirect_to admins_dashboard_sermons_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sermon = Sermon.find(params[:id])

    @sermon.destroy
    redirect_to admins_dashboard_sermons_path, status: :see_other
  end


  private 

  def sermon_params
    params.require(:sermon).permit(:title, :description, :format, :video_url, :audio_url, :duration, :date, :category, :bible_text, :language
    )
  end  
end
