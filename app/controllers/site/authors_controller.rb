class Site::AuthorsController < SiteController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
end
