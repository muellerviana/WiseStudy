class AdminsDashboard::SermonsController < AdminsDashboardController
  def index
    @sermons = Sermon.all
  end

  def show
    @sermon = Sermon.find(params[:id])
  end

  
end
