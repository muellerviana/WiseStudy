class TableHeaderComponent < ViewComponent::Base
  def initialize(titles:)
    super

    @titles = titles
  end
end
