class AdminsDashboard::StrongsEntriesController < AdminsDashboardController
  def index
    @strongs_entries = StrongsEntry.all
  end

  def show
    @strongs_entry = StrongsEntry.find(params[:id])
  end
end
