class BadgeComponentPreview < ViewComponent::Preview
  def default
    render(BadgeComponent.new) do
      "Label"
    end
  end
end