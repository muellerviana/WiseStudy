class Site::SermonsController < SiteController
  def index
    @sermons = Sermon.all
  end
end
