class Site::AuthorsController < SiteController
  def index
    @authors =Author.all
  end
end
