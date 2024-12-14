class Site::SermonsController < SiteController
  def index
    @sermons = Sermon.all
  end

  def show 
    @sermon = Sermon.find(params[:id])
  end
end
